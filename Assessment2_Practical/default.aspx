<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Assessment2_Practical._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TaskMaster - Empower Your Productivity</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="defaultStyles.css" />
     <!-- Link Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <!-- Link Google Fonts (young, mid-style font) -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="Index.html">
                    <!--logo image-->
                    <img src="images/site-logo.png" alt="Your Logo"/>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <!-- Add your Signup and Login links here -->
                        <li class="nav-item">
                            <a class="nav-link" href="SignUp.aspx">Sign-Up</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Authentication.aspx">Login</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="masthead">
            <img src="images/beach.jpg" class="rounded-logo" alt="TaskMaster Logo" />
            <h1 class="display-2">TASK-MASTER</h1>
            <h2>Take Control of Your Tasks, Master Your Day</h2>
            <asp:Button ID="Button1" runat="server" CssClass="btn-get-started btn btn-primary btn-lg" Text="Get Started" OnClick="Button1_Click" />
        </div>
        <div class="container our-services">
            <h3>Our Services</h3>
            <div class="row">
                <div class="col-md-4">
                    <div class="service-card">
                        <img src="images/activity.jpg" alt="Activity Planning" />
                        <div class="service-title">Activity Planning</div>
                        <div class="service-description">
                            TaskMaster offers efficient activity planning tools that help you organize and prioritize your tasks.
                        </div>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#activityModal">
                            Learn More
                        </button>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <img src="images/task.jpg" alt="Task Management" />
                        <div class="service-title">Task Management</div>
                        <div class="service-description">
                            Effortlessly create, edit, and track tasks with TaskMaster's streamlined task management.
                        </div>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#taskModal">
                            Learn More
                        </button>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <img src="images/time.jpg" alt="Time Management" />
                        <div class="service-title">Time Management</div>
                        <div class="service-description">
                            Optimize your productivity with TaskMaster's time management features. Allocate specific time slots for each task.
                        </div>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#timeModal">
                            Learn More
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Activity Planning Modal -->
        <div class="modal fade" id="activityModal" tabindex="-1" aria-labelledby="activityModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="activityModalLabel">Activity Planning</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        TaskMaster's activity planning feature allows you to efficiently organize and prioritize your tasks. You can create structured plans, assign priorities, set deadlines, and visualize tasks based on importance.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Task Management Modal -->
        <div class="modal fade" id="taskModal" tabindex="-1" aria-labelledby="taskModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="taskModalLabel">Task Management</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        TaskMaster excels in task management, empowering you to streamline your workflow. Easily create, edit, and track tasks, ensuring nothing is overlooked. Stay organized and achieve your goals with ease.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Time Management Modal -->
        <div class="modal fade" id="timeModal" tabindex="-1" aria-labelledby="timeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="timeModalLabel">Time Management</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        TaskMaster offers effective time management tools to help you make the most of your valuable time. Allocate specific time slots for each task, ensuring a realistic schedule. Optimize your productivity, meet deadlines, and maintain a balanced approach to your activities.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container about-us">
            <h3>About Us</h3>
            <p>
                TaskMaster is a user-centric web application dedicated to empowering individuals in managing their daily tasks and optimizing their productivity.
            </p>
            <p>
                With TaskMaster, users can effortlessly create, edit, and track tasks, ensuring nothing falls through the cracks. Our intuitive interface provides a clear view of tasks, allowing users to stay organized and focused on what matters most.
            </p>
            <p>
                We believe in the power of effective task and time management to enhance productivity. TaskMaster offers features such as activity planning, task categorization, and deadline setting, enabling users to prioritize tasks and make the most of their valuable time.
            </p>
            <p>
                Our commitment is to continuously improve TaskMaster based on user feedback and evolving needs. We strive to provide a seamless and user-friendly experience, helping individuals reclaim their time and accomplish more.
            </p>
            <p>
                Join TaskMaster today and experience the difference in task management. Unlock your productivity potential and take control of your tasks like never before.
            </p>
            <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Text="Sign Up" OnClick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" CssClass="btn btn-secondary" Text="Login" OnClick="Button3_Click" />
        </div>
           <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h4>Contact Us</h4>
                    <p>Email: solulelekwani@gmail.com</p>
                    <p>Phone: +27 65 724 3048</p>
                </div>
                <br/>
                <br/>
                <div class="col-md-4">
                    <h4>Follow Us</h4>
                    <br/>
                    <div class="social-icons">
                        <a href="https://wa.me/27657243048" target="_blank" class="social-icon">
                            <img src="./images/social-whatsapp.png" alt="WhatsApp"/>
                        </a>
                        <a href="https://www.instagram.com/sosounplugged/" target="_blank" class="social-icon">
                            <img src="./images/social-instagram.png" alt="Instagram"/>
                        </a>
                        <a href="https://youtube.com/@SosoUnplugged" target="_blank" class="social-icon">
                            <img src="./images/social-youtube.png" alt="YouTube"/>
                        </a>
                        <a href="https://www.linkedin.com/in/solulele-mabulu-5aaa1226a/" target="_blank" class="social-icon">
                            <img src="./images/social-linkedIn.png" alt="LinkedIn"/>
                        </a>
                        <a href="https://www.facebook.com/profile.php?id=100076461759123" target="_blank" class="social-icon">
                            <img src="./images/social-facebook.png" alt="Facebook"/>
                        </a>
                    </div>                    
                </div>
                <br/>
                <br/>
                <div class="col-md-4">
                    <h4>Address</h4>
                    <p>50 Steve Biko Street, Potchefstroom, 2025, North West</p>
                </div>
            </div>
            <hr/>
            <p>&copy; 2023 Soso-Unplugged. All rights reserved.</p>
        </div>
    </footer>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Link Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
