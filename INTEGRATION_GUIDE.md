# Flutter Contact Form + FastAPI Integration Guide

Your Flutter portfolio app is now integrated with a FastAPI backend for handling contact form submissions!

## What's Been Implemented

### 1. Flutter App Changes
- ✅ Added HTTP dependency to `pubspec.yaml`
- ✅ Created `ContactService` class for API communication
- ✅ Updated `ExpandableTextField` to accept controller and callback
- ✅ Integrated form submission with validation and error handling
- ✅ Added success/error feedback with SnackBar notifications

### 2. FastAPI Backend
- ✅ Created complete FastAPI server with CORS support
- ✅ Contact form endpoint with email validation
- ✅ In-memory storage for submissions
- ✅ Admin endpoint to view submissions

## How to Test the Integration

### Step 1: Start the FastAPI Backend
```bash
cd backend
pip install -r requirements.txt
python main.py
```

The server will start on `http://localhost:8000`

### Step 2: Run Your Flutter App
```bash
flutter run -d chrome  # For web testing
# or
flutter run  # For mobile/desktop
```

### Step 3: Test the Contact Form
1. Navigate to the Contact page in your Flutter app
2. Fill out the form:
   - Email: Enter a valid email address
   - Subject: Enter a topic/subject
   - Message: Enter your message
3. Click "Send Message"
4. You should see a success message if everything works

### Step 4: Verify Backend
- Check the terminal where you ran the FastAPI server - you should see submission logs
- Visit `http://localhost:8000/submissions` to see all submissions

## API Endpoint Details

**URL:** `POST http://localhost:8000/contact`

**Request Body:**
```json
{
  "email": "user@example.com",
  "topic": "Project Inquiry", 
  "message": "Hi, I'm interested in working with you..."
}
```

**Success Response:**
```json
{
  "success": true,
  "message": "Contact form submitted successfully!",
  "submission_id": 1,
  "timestamp": "2024-01-15T10:30:00"
}
```

## Form Validation

The Flutter app now includes:
- ✅ Required field validation
- ✅ Email format validation
- ✅ Loading state feedback
- ✅ Success/error messages
- ✅ Form clearing after successful submission

## Production Deployment

### Backend Deployment
1. Deploy your FastAPI app to a cloud service (Railway, Render, Heroku, etc.)
2. Update the `baseUrl` in `lib/services/contact_service.dart`:
   ```dart
   static const String baseUrl = 'https://your-backend-url.com';
   ```

### CORS Configuration
Update the CORS settings in `backend/main.py`:
```python
app.add_middleware(
    CORSMiddleware,
    allow_origins=["https://your-flutter-app-domain.com"],  # Your domain
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

### Database Integration
Replace the in-memory storage with a proper database:
- PostgreSQL with SQLAlchemy
- MongoDB with motor
- Firebase Firestore
- Supabase

## Troubleshooting

### Common Issues

1. **CORS Error**: Make sure the FastAPI server is running and CORS is configured
2. **Connection Refused**: Check if the backend URL is correct in `ContactService`
3. **Validation Errors**: Ensure all fields are filled and email is valid
4. **HTTP Package Not Found**: Run `flutter pub get` to install dependencies

### Debug Mode
To see detailed API responses, you can add logging to `ContactService`:
```dart
print('Response: ${response.body}');
```

## Next Steps

1. **Email Notifications**: Add email sending functionality to notify you of new submissions
2. **Database**: Replace in-memory storage with a proper database
3. **Authentication**: Add admin authentication for viewing submissions
4. **Rate Limiting**: Prevent spam submissions
5. **File Uploads**: Add support for file attachments
6. **Analytics**: Track form submissions and user behavior

## Files Modified/Created

### Flutter App
- `pubspec.yaml` - Added HTTP dependency
- `lib/services/contact_service.dart` - New API service
- `lib/widgets/expandable_textfield.dart` - Added controller and callback support
- `lib/pages/contact_page.dart` - Integrated form submission

### Backend
- `backend/main.py` - FastAPI server
- `backend/requirements.txt` - Python dependencies
- `backend/README.md` - Backend documentation

Your contact form is now fully functional and ready for production use! 🎉 