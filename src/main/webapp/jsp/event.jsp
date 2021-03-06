<%@include file="/jsp/index.components/header.jsp" %>
<s:query dataSource="${snapshot}" var="events">
    SELECT * FROM events ORDER BY 1;
</s:query>
<main class="main">

    <div class="grid">

        <h1>Event</h1>

        <a href="<c:url value="/jsp/studentEvents.jsp"/>">
            <button class="btn btn-primary">
                My events
            </button>
        </a>

        <a href="<c:url value="/jsp/eventParticipation.jsp"/>">
            <button class="btn btn-primary">
                My participation
            </button>
        </a>
        <c:forEach var="row" items="${events.rows}">
            <div class="text-center">
                <ul class="list-group">
                    <li class="list-group-item">${row.event_id}</li>
                    <li class="list-group-item">${row.event_name}</li>
                    <li class="list-group-item">${row.event_start_date}</li>
                    <li class="list-group-item">${row.event_end_date}</li>
                    <li class="list-group-item">${row.event_creator_id}</li>
                    <form action="<c:url value="/add/event"/>" method="post">
                        <input type="hidden" name="id" value="${row.event_id}">
                        <input class="bg-light text-primary border rounded border-primary mt-1 btn-lg col-2 align-self-center"
                               type="submit" value="Participate">
                    </form>
                </ul>
                <br>
            </div>
        </c:forEach>

    </div>

</main>

<%@include file="/jsp/index.components/footer.jsp" %>