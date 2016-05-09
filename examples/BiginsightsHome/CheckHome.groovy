import geb.Browser
import org.openqa.selenium.firefox.FirefoxDriver

def browser = new Browser(driver: new FirefoxDriver())

env = System.getenv()

def username = env.username
def password = env.password
def gateway = env.gateway

def matcher = gateway =~ /^(https?:\/\/)([^:^\/]*)(:\d*)?(.*)?.*$/
def host = matcher[0][2]
def port = matcher[0][3]

BiHome = "https://" + username + ":" + password + "@" + host + port + "/gateway/default/BigInsightsWeb/#/welcome"

println "Opening BIHOME"
println BiHome

browser.drive {

    go BiHome

    // Check we enter BigInsights Home
    assert title == "IBM BigInsights"

    // Check for BigSheets box
    println "Check BigSheets"
    assert $("div", class: "comp-name ng-binding").eq(0).text() == "BigSheets"

    println "Check for Text Analytics"
    assert $("div", class: "comp-name ng-binding").eq(1).text() == "Text Analytics"

    println "Check for Data Server Manager for Big SQL"
    assert $("div", class: "comp-name ng-binding").eq(2).text() == "Data Server Manager for Big SQL"

    // Check that all services are available
    println "Check there are no unavailable service"
    assert $("div", class: "header").has(".ng-scope").size() == 0
}

browser.close()
