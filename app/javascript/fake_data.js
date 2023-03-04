const submit_btn = document.getElementById("data-submit")
submit_btn.addEventListener('click', function(){

    const xhttp = new XMLHttpRequest();
    const select_element = document.getElementById("data-class")

    let url = "faker_data";
    let data_class = select_element.options[select_element.options.selectedIndex].text
    let data_quantity = document.getElementById("data-quantity").value

    let params = JSON.stringify({
        data_class: data_class,
        data_quantity: data_quantity
    })

    xhttp.open("POST", url, true);
    xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
    xhttp.onload = function() {
        const content_box = document.getElementById("data-content")
        if (xhttp.status == 200){
            let response = JSON.parse(xhttp.response)
            let html = ""
            const a = Array(response.attributes)
            a[0].data.forEach((item)=>{
                   html = html + `<p>${item}</p>`
            })
            content_box.innerHTML = html
        }
            else {
                content_box.innerHTML = ""
            }
        
      }

    xhttp.send(params);
})


console.log("fake data out")