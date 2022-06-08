<%@ page import = "java.text.NumberFormat" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Edit Company | Temu Saham</title>
    <link rel="stylesheet" href="../styles/create_edit_company_style.css" />
    <link rel="stylesheet" href="../styles/style.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body>
    <%@ include file="../navbars/navbar_views_not_login.jsp" %>
    <%
      String userId = (String) session.getAttribute("userId");
      //TODO getCompanyId
      String companyId = "13"; // Change to get company id by user id or whatever

      //Company company = getCompanyById;
      //String name = company.name;
      //String description = company.description;
      //String location = company.location;
      //Long investmentTarget = company.investmentTarget;
      //Long investmentStock = company.investmentStock;
      //String logo = company.logo;
      //String email = company.email;
      //String phone = company.phone;
      //String url = company.url;
      //Long foundedYear = company.foundedYear;
      //String category = company.category;

      //Delete this when the above code is uncommentted
      String name = "name";
      String description = "description";
      String location = "locationnnnnnn";
      Long investmentTarget = Long.valueOf(100000000);
      Long investmentStock = Long.valueOf(40);
      String logo = "logo";
      String email = "albert.heru@binus.ac.id";
      String phone = "phone number";
      String url = "";
      Long foundedYear = Long.valueOf(2022);
      String category = "foodAndBeverage";

      NumberFormat formatPrice = NumberFormat.getInstance();

      String[] categoryList = {"technology", "banking", "foodAndBeverage"};
      String[] categoryOutputList = {"Technology", "Banking", "Food and Beverage"};
    %>
    <section>
      <div class="create_edit_company">
        <h1 style="text-align: center; font-size: 40px; padding-top: 30px">
          Edit Company
        </h1>
        <form
          action="controllers/edit_company_controller.jsp"
          method="post"
          name="createCompanyForm"
          onsubmit="return validateCreateCompany()"
        >
          <input type="hidden" name="companyId" value="<%= companyId %>">
          <div class="form_input">
            <label for="name">Company Name</label>
            <input type="text" name="name" value="<%= name %>" readonly/>
          </div>

          <div class="form_input">
            <label for="description">Company Description</label>
            <textarea name="description" id="" cols="30" rows="10">
              <%= description %>
            </textarea>
          </div>

          <div class="form_input">
            <label for="location">Company Location</label>
            <input type="text" name="location" value="<%= location %>" readonly/>
          </div>

          <div class="form_input">
            <label for="investmentTarget">Investment Target (in IDR)</label>
            <input type="text" name="investmentTarget" value="<%= formatPrice.format(investmentTarget) %>" readonly/>
          </div>

          <div class="form_input">
            <label for="investmentStock">Investment Stock (in percent)</label>
            <input type="text" name="investmentStock" value="<%= investmentStock %>" readonly/>
          </div>

          <div class="form_input">
            <label for="logo">Company Logo</label>
            <input type="text" name="logo" value="<%= logo %>" />
          </div>

          <div class="form_input">
            <label for="email">Company Email</label>
            <input type="text" name="email" value="<%= email %>" />
          </div>

          <div class="form_input">
            <label for="phone">Company Phone Number</label>
            <input type="text" name="phone" value="<%= phone %>" />
          </div>

          <div class="form_input">
            <label for="url">Company Website URL (if any)</label>
            <input type="text" name="url" placeholder="Input your company website URL..." value="<%= url %>" />
          </div>

          <div class="form_input">
            <label for="foundedYear">Company Founded Year</label>
            <input type="text" name="foundedYear" value="<%= foundedYear %>" readonly/>
          </div>

          <div class="form_input">
            <label for="Information">Company Category</label>
            <div class="personal-information">
              <%
                for(int i = 0 ; i < 3 ; i++) {
                  if(category.equals(categoryList[i])) {
                    %>
                    <div class="form-check">
                      <input
                        class="form-check-input"
                        type="radio"
                        name="category"
                        value="<%= categoryList[i] %>"
                        disabled
                        checked
                      />
                      <label class="form-check-label" for="<%= categoryList[i] %>">
                        <%= categoryOutputList[i] %>
                      </label>
                    </div>
                    <%
                  } else {
                    %>
                    <div class="form-check">
                      <input
                        class="form-check-input"
                        type="radio"
                        name="category"
                        value="<%= categoryList[i] %>"
                        disabled
                      />
                      <label class="form-check-label" for="<%= categoryList[i] %>">
                        <%= categoryOutputList[i] %>
                      </label>
                    </div>
                    <%
                  }
                }
              %>
              
            </div>
          </div>

          <button type='button' onclick='window.history.back();'>Cancel</button>
          <input type="submit" id="submit" value="Update" />
        </form>
      </div>
    </section>

    <script>
      function validateCreateCompany() {
        let name = document.forms["createCompanyForm"]["name"].value;
        let description = document.forms["createCompanyForm"]["description"].value;
        let location = document.forms["createCompanyForm"]["location"].value;
        let investmentTarget = document.forms["createCompanyForm"]["investmentTarget"].value;
        let investmentStock = document.forms["createCompanyForm"]["investmentStock"].value;
        let logo = document.forms["createCompanyForm"]["logo"].value;
        let email = document.forms["createCompanyForm"]["email"].value;
        let phone = document.forms["createCompanyForm"]["phone"].value;
        let url = document.forms["createCompanyForm"]["url"].value;
        let foundedYear = document.forms["createCompanyForm"]["foundedYear"].value;
        let category = document.getElementsByName("category");

        let regexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

        let categorySelected = false;

        for (let i = 0; i < category.length; i++) {
          if (category[i].checked) {
            categorySelected = true;
            break;
          }
        }

        if (name == "") {
          alert("Name must not be empty");
          return false;
        } else if (description == "") {
          alert("Description must not be empty");
          return false;
        } else if (location == "") {
          alert("Location must not be empty");
          return false;
        } else if(investmentTarget == "") {
          alert("Investment target must not be empty");
          return false;
        } else if(investmentStock == "") {
          alert("Investment stock must not be empty");
          return false;
        } else if(logo == "") {
          alert("Logo url must not be empty");
          return false;
        } else if(email == "") {
          alert("Email must not be empty");
          return false;
        } else if(phone == "") {
          alert("Phone number must not be empty");
          return false;
        } else if(foundedYear == "") {
          alert("Founded year must not be empty");
          return false;
        } else if(!categorySelected) {
          alert("Your have to select your company category");
          return false;
        } else if(name.length < 2) {
          alert("Company name must consists of at least 2 characters");
          return false;
        } else if(location.length < 10) {
          alert("Company location must consists of at least 10 characters");
          return false;
        } else if(!email.match(regexEmail)) {
          alert("Enter a valid email");
          return false;
        } else {
          let confirmCreateCompany = confirm("Are you sure you want to update the company with above data?");
          if(confirmCreateCompany) {
            alert("Company updated successfully");
            return true;
          } else {
            return false;
          }
        }
      }
    </script>

    <%@ include file="../footers/footer.jsp" %>
  </body>
</html>
