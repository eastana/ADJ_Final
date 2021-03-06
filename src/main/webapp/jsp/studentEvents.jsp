<%@include file="/jsp/index.components/header.jsp"%>
<s:query dataSource = "${snapshot}" var = "events">
    SELECT * FROM events WHERE event_creator_id=${sessionScope.user.id} ORDER BY 1;
</s:query>
<main class="main">

    <div class="grid">

        <h1>My events</h1>

        <div class="btn-group" role="group" aria-label="Basic example">
            <a href="<%=application.getContextPath()%>/jsp/addEvent.jsp">
                <button class="bg-warning border rounded border-warning mb-auto">Add event</button>
            </a>
        </div>

        <c:choose>
            <c:when test="${events.rows[0]==null}">
                <div class="text-center">
                    <ul class="list-group">
                        <li class="list-group-item">You have no events</li>
                    </ul>
                    <br>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="row" items="${events.rows}">
                    <div class="text-center">
                        <ul class="list-group">
                            <li class="list-group-item">${row.event_id}</li>
                            <li class="list-group-item">${row.event_name}</li>
                            <li class="list-group-item">${row.event_start_date}</li>
                            <li class="list-group-item">${row.event_end_date}</li>
                            <li class="list-group-item">${row.event_creator_id}</li>

                            <form action="<c:url value="/event"/>">
                                <input type="hidden" name="eventId" value="${row.event_id}">
                                <input type="submit"
                                       class="bg-light text-primary border rounded border-primary mt-1 btn-lg col-2 align-self-center edit"
                                       name="btnVal"
                                       value="Edit">
                            </form>

                            <form action="<c:url value="/event"/>" method="post">
                                <input type="hidden" name="id" value="${row.event_id}">
                                <button class="bg-light text-danger border rounded border-danger btn-lg delete col-2 align-self-center"
                                        name="btnVal"
                                        value="delete">
                                    Delete
                                </button>
                            </form>
                        </ul>
                        <br>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>


    </div>

</main>

<%@include file="/jsp/index.components/footer.jsp"%>