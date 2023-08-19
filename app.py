import sys
from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QScrollArea, QLabel, QLineEdit, QComboBox, QTableWidget, QTableWidgetItem
from PyQt5.QtSql import QSqlDatabase, QSqlQuery
import settings as st


class MainWindow(QWidget):
    def __init__(self):
        super().__init__()

        db = QSqlDatabase.addDatabase('QPSQL')
        db.setHostName(st.db_params['host'])
        db.setPort(st.db_params['port'])
        db.setDatabaseName(st.db_params['dbname'])
        db.setUserName(st.db_params['username'])
        db.setPassword(st.db_params['password'])
        db.open()

        self.layout = QVBoxLayout()
        self.scrollArea = QScrollArea()
        self.scrollArea.setWidgetResizable(True)
        self.scrollContent = QWidget(self.scrollArea)
        self.scrollArea.setWidget(self.scrollContent)
        self.layout.addWidget(self.scrollArea)
        self.setLayout(self.layout)
        self.setWindowTitle('Окно с таблицей')

        self.tableWidget = QTableWidget()
        self.tableWidget.setColumnCount(3)
        self.tableWidget.setHorizontalHeaderLabels(["ФИО", "Папка с документами", "Статус"])
        self.layout.addWidget(self.tableWidget)

        self.loadTableData()

    def loadTableData(self):
        query = QSqlQuery("SELECT * FROM your_table")
        row = 0
        while query.next():
            fio = query.value(0)
            folder = query.value(1)
            status = query.value(2)

            self.tableWidget.insertRow(row)
            self.tableWidget.setItem(row, 0, QTableWidgetItem(fio))
            self.tableWidget.setItem(row, 1, QTableWidgetItem(folder))
            self.tableWidget.setItem(row, 2, QTableWidgetItem(status))
            row += 1


if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = MainWindow()
    mainWindow.show()
    sys.exit(app.exec_())