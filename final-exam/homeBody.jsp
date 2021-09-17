<div class="container container-menu">
    <h2 class="title">Our Menu</h2>
    <h5 class="subtitle">Fresh and Authentic Japanese Cuisine</h5>
        <div class="menu-groups">
            <div class="row row-cols-1 row-cols-md-3">
                <% 
                    try {
                        String getFood = "SELECT * FROM foods";
                        PreparedStatement placeStatement = con.prepareStatement(getFood);
                        ResultSet resultFood = placeStatement.executeQuery();
    
                        while(resultFood.next()){
                %>
                        <form action="cartProcess.jsp" method="POST">
                            <div class="col mb-4">
                                <div class="card">
                                <img src=<%=resultFood.getString("foodImg")%> alt="">
                                    <div class="card-body">
                                        <h5 class="card-title"><%=resultFood.getString("foodName")%> </h5>
                                        
                                        <div class="price">
                                            <img src="https://image.flaticon.com/icons/png/512/1829/1829699.png" alt="">
                                            <%=resultFood.getInt("foodPrice")%>
                                        </div>
        
                                        <%if (resultFood.getInt("foodStock")==0){ %>
                                            <button class="btn btn-block empty-stock" disabled >Out of Stock</button>
                                        <%}else{%>
                                            <input type="hidden" name="foodID" value = "<%=resultFood.getInt("foodID")%>">
                                            <button type="button" class="btn btn-block avail-stock" data-toggle="modal" data-target="#qtyModal<%=resultFood.getInt("foodID")%>">Place Order</button>
                                            <div class="modal fade" id="qtyModal<%=resultFood.getInt("foodID")%>" tabindex="-1" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Please input the quantity of <%=resultFood.getString("foodName")%> </h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <label for="foodQty<%=resultFood.getInt("foodID")%>">Quantity: </label>
                                                        <input id="foodQty<%=resultFood.getInt("foodID")%>" name="foodQty" type="number">
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn cont-cart">Continue to Cart</button>
                                                    </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <%}%>
                                    </div>
                                </div> 
                            </div>
                        </form>      
                <%
                        }
                    } catch (Exception e) {
                        
                    }
                %>
            </div>
        </div>
</div>
