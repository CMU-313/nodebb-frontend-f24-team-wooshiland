<div data-widget-area="header">
    {{{ each widgets.header }}}
    {{widgets.header.html}}
    {{{ end }}}
</div>

<div class="row py-2">
    <!-- Main Content Area -->
    <div class="{{{ if widgets.sidebar.length }}}col-lg-9 col-sm-12{{{ else }}}col-lg-12{{{ end }}}">
        
        <!-- Source: ChatGPT -->
		<!-- Queue Header -->
        <h1>Office Hours Queue</h1>
        <p>Manage the office hours queue below. Join or leave as needed.</p>

        <!-- Queue Status -->
        <h2>Queue Status</h2>
        <p id="queue-length">Loading queue data...</p>

        <!-- List of People in Queue -->
        <ul id="queue-items" class="list-unstyled">
            <!-- Queue items will be dynamically added here -->
        </ul>

        <!-- Queue Controls -->
        <button id="join-queue-btn" class="btn btn-primary">Join Queue</button>
        <button id="leave-queue-btn" class="btn btn-danger">Leave Queue</button>

        <!-- Pagination (if necessary) -->
        {{{ if pagination.pages.length }}}
        <!-- IMPORT partials/paginator.tpl -->
        {{{ end }}}

    </div>

    <!-- Sidebar (if widgets are present) -->
    <div data-widget-area="sidebar" class="col-lg-3 col-sm-12 {{{ if !widgets.sidebar.length }}}hidden{{{ end }}}">
        {{{ each widgets.sidebar }}}
        {{widgets.sidebar.html}}
        {{{ end }}}
    </div>
</div>

<div data-widget-area="footer">
    {{{ each widgets.footer }}}
    {{widgets.footer.html}}
    {{{ end }}}
</div>

<!-- Script to manage queue interactions -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const queueLengthElem = document.getElementById('queue-length');
        const queueItemsElem = document.getElementById('queue-items');
        const joinQueueBtn = document.getElementById('join-queue-btn');
        const leaveQueueBtn = document.getElementById('leave-queue-btn');

        const queue = ['Student 1', 'Student 2', 'Student 3']; // Simulated queue data

        function updateQueue() {
            queueLengthElem.innerText = `There are ${queue.length} people in the queue.`;
            queueItemsElem.innerHTML = '';
            queue.forEach((item) => {
                const li = document.createElement('li');
                li.textContent = item;
                queueItemsElem.appendChild(li);
            });
        }

        // Update queue on page load
        updateQueue();

        // Join queue button functionality
        joinQueueBtn.addEventListener('click', function () {
            queue.push('New Student');
            updateQueue();
        });

        // Leave queue button functionality
        leaveQueueBtn.addEventListener('click', function () {
            queue.pop();
            updateQueue();
        });
    });
</script>

