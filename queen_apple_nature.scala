import scala.collection.mutable.Map

object EducationForAll {

  // Default parameters
  val defaultParameters: Map[String, Any] = Map(
    "targetCountry" -> "Kenya",
    "numSchools" -> 1000,
    "numTeachers" -> 5000,
    "numStudents" -> 500000,
    "schoolType" -> "public"
  )

  // Function to set parameters
  def setParameters(params: Map[String, Any]): Unit = {
    params. foreach { case (key, value) =>
      defaultParameters(key) = value
    }
  }

  // Function to get parameters
  def getParameters(): Map[String, Any] = defaultParameters

  // Calculate the total cost for the project
  def calculateCost(): Double = {
    var cost: Double = 0.0

    val numSchools: Int = defaultParameters("numSchools").asInstanceOf[Int]
    val numTeachers: Int = defaultParameters("numTeachers").asInstanceOf[Int]
    val numStudents: Int = defaultParameters("numStudents").asInstanceOf[Int]
    val schoolType: String = defaultParameters("schoolType").asInstanceOf[String]

    // Calculate the cost of building new schools
    cost += numSchools * 2000000

    // Calculate the cost of hiring new teachers
    cost += numTeachers * 100000

    // Calculate the cost of textbooks
    cost += numStudents * 50

    // Calculate the cost of additional supplies
    cost += (numStudents * 5).toDouble

    // Calculate the cost of teacher training
    if (schoolType == "public") {
      cost += (numTeachers * 75).toDouble
    }

    cost
  }

  // Main function
  def main(args: Array[String]): Unit = {
    // Set parameters
    setParameters(Map(
      "targetCountry" -> "Kenya",
      "numSchools" -> 1000,
      "numTeachers" -> 5000,
      "numStudents" -> 500000,
      "schoolType" -> "public"
    ))

    // Calculate the cost of the project
    val cost = calculateCost()
    println(s"The total cost of the education for all project in ${defaultParameters("targetCountry")} is: $cost")
  }

}