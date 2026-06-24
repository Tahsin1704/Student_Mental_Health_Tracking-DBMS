create database UMH
Go
use UMH
Go

create table Student (
    student_id char(20)primary key,
    name char(100),
    date_of_birth date,
age int,
    gender char(10),
    email varchar(100) unique,
    phone varchar(15) unique
)

Go

create table Student_mental_health_survey (
    survey_id char(20) primary key,
    student_id char (20),
survey_date date,
    survey_type varchar(50),
    student_mood varchar(50),
    comment char(100),
    foreign key (student_id) references Student(student_id)
)

Go

create table Therapist ( 
    therapist_id char(20) primary key,
    first_name char(50),
    last_name char(50),
    email varchar(100) unique,
salary int not null
)

Go

create table Student_therapy_session (
    session_id char(20) primary key,
    student_id char (20),
    therapist_id char (20),
    session_date date,
    duration int,
    session_reports varchar(500),
    foreign key (student_id) references Student(student_id),
    foreign key (therapist_id) references Therapist(therapist_id)
)

Go




create table Diagnosis ( --- dekhte hobe
    diagnosis_report varchar(50),
    diagnosis_id char(20),
    student_id char(20),
    diagnosis_date date,
    diagnosis_code varchar(50),
primary key (diagnosis_report,Diagnosis_id),
    foreign key (student_id) references student(student_id)
)


Go

create table Student_medical_history (
    student_id char(20),
medical_report varchar(50) primary key,
    medical_record_type varchar(50),
    record_date date,
    foreign key (student_id) references student(student_id)
)

Go


create table Treatment (  -- diagnosis niye jhamela
    treatment_id char(20) primary key,
    diagnosis_id char(20),
    diagnosis_report varchar(50),
medical_report varchar(50),
    treatment_plan varchar(500),
    start_date date,
    end_date date,
    foreign key (diagnosis_report, diagnosis_id) references Diagnosis(diagnosis_report, diagnosis_id),
    foreign key (medical_report) references Student_medical_history(medical_report)
)

Go


create table Medication (
    medication_id char(20) primary key,
    student_id char(20),
    medication_name varchar(100),
    dosage varchar(50),
    start_date date,
    end_date date,
    medication_side_effect varchar(500),
    foreign key (student_id) references student(student_id)
)

Go

create table Student_assessment (
    assessment_id char(20) primary key,
    student_id char(20),
    assessment_start_date date,
    assessment_end_date date,
    assessment_type varchar(50),
    foreign key (student_id) references student(student_id)
)

Go

create table Student_observation (
    observation_id char(20) primary key,
    student_id char(20),
    observation_date date,
    observation_type varchar(50),
    observation_report varchar(500),
    foreign key (student_id) references student(student_id)
)

Go

create table Mental_Health_problemwise_group (
    group_name char(100) not null,
student_id char(20) not null,
    group_times nvarchar(100),
    group_performance int check(group_performance >= 0 and group_performance <= 10),
primary key (group_name, student_id),
    foreign key (student_id) references student(student_id)
)

Go


 create table Student_attendance (
    attendance_id char (20) primary key,
    student_id char(20),
    group_name char (100),
    attendance_date date,
    group_effects nvarchar(500),
    foreign key (student_id) references student(student_id),
    foreign key (group_name,student_id) references Mental_Health_problemwise_group(group_name,student_id)
)

Go

create table Emergency_intervention (
    emergency_id char(20) primary key,
    student_id char(20),
    intervention_date date,
    intervention_type varchar(50),
    intervention_outcome varchar(500),
    comments varchar(500),
    foreign key (student_id) references student(student_id)
)

Go

INSERT INTO Student (student_id, name, date_of_birth, age, gender, email, phone)
VALUES
('22201207', 'Muhib', '1999-05-15', 20, 'Male', 'muhib@example.com', '01711123456'),
('22201206', 'Tahsin', '2000-07-10', 21, 'Male', 'tahsin@example.com', '01711234567'),
('22201208', 'Minhaz', '1999-03-20', 20, 'Male', 'minhaz@example.com', '01711345678'),
('22201209', 'Joy', '1998-12-25', 26, 'Male', 'joy@example.com', '01711456789'),
('22201216', 'Urbana', '2000-01-05', 30, 'Female', 'urbana@example.com', '01711567890'),
('22201197', 'Asif', '1999-09-13', 25, 'Male', 'asif@example.com', '01711678901'),
('22201202', 'Nawmi', '1999-08-10', 25, 'Female', 'nawmi@example.com', '01711789012'),
('22201200', 'Masud', '2000-11-02', 24, 'Male', 'masud@example.com', '01711890123'),
('22201205', 'Roudro', '1998-10-05', 26, 'Male', 'roudro@example.com', '01711901234'),
('22201204', 'Arnob', '1999-07-19', 23, 'Male', 'arnob@example.com', '01712012345'),
('22201203', 'Shihab', '2000-06-25', 24, 'Male', 'shihab@example.com', '01712123456'),
('22201220', 'Alif', '1999-04-17', 25, 'Male', 'alif@example.com', '01712234567'),
('22201196', 'Shahriar', '2000-02-18', 24, 'Male', 'shahriar@example.com', '01712345678'),
('22201190', 'Jisan', '2000-03-30', 27, 'Male', 'jisan@example.com', '01712456789'),
('22201214', 'Urmi', '1999-08-24', 25, 'Female', 'urmi@example.com', '01712567890'),
('22201213', 'Puja', '1999-07-15', 25, 'Female', 'puja@example.com', '01712678901'),
('22201219', 'Lubna', '2000-02-12', 24, 'Female', 'lubna@example.com', '01712789012'),
('22201218', 'Tabeeb', '1999-11-05', 25, 'Male', 'tabeeb@example.com', '01712890123'),
('22201217', 'Humaira', '2000-03-10', 24, 'Female', 'humaira@example.com', '01712901234'),
('22201210', 'Priyonti', '1999-06-22', 25, 'Female', 'priyonti@example.com', '01713012345'),
('22201211', 'Naina', '2000-09-30', 24, 'Female', 'naina@example.com', '01713123456'),
('22201212', 'Shahria', '1999-01-17', 25, 'Female', 'shahria@example.com', '01713234567'),
('22201195', 'Nishat', '2000-04-25', 24, 'Female', 'nishat@example.com', '01713345678'),
('22201198', 'Annie', '1999-08-30', 25, 'Female', 'annie@example.com', '01713456789'),
('22201199', 'Moumi', '2000-07-18', 24, 'Female', 'moumi@example.com', '01713567890')



select * from Student

INSERT INTO Student_mental_health_survey (survey_id, student_id, survey_date, survey_type, student_mood, comment)
VALUES
('S1', '22201207', '2024-11-01', 'Mood Survey', 'Good', 'Feeling relaxed after last therapy session'),
('S2', '22201206', '2024-10-02', 'Stress Survey', 'Neutral', 'Feeling a bit overwhelmed with exams coming up'),
('S3', '22201208', '2024-11-03', 'Satisfaction Survey', 'Stressed', 'Having trouble concentrating on studies, need support'),
('S4', '22201209', '2024-09-04', 'Behavioral Survey', 'Happy', 'No major issues, everything seems fine'),
('S5', '22201216', '2024-08-05', 'Mood Survey', 'Sad', 'Feeling a little down lately'),
('S6', '22201197', '2024-08-06', 'Stress Survey', 'Good', 'Recovering well after treatment, no stress'),
('S7', '22201202', '2024-05-07', 'Satisfaction Survey', 'Anxious', 'Getting anxious before exams, but working on it'),
('S8', '22201200', '2024-01-08', 'Mood Survey', 'Excited', 'Very excited about upcoming events'),
('S9', '22201205', '2024-12-09', 'Behavioral Survey', 'Angry', 'Frustrated with certain people, need to manage emotions'),
('S10', '22201204', '2024-04-10', 'Satisfaction Survey', 'Neutral', 'Not feeling anything special, neutral mood'),
('S11', '22201203', '2024-03-11', 'Stress Survey', 'Happy', 'Feeling positive and motivated, stress-free'),
('S12', '22201220', '2024-02-12', 'Behavioral Survey', 'Sad', 'Feeling homesick lately, could use some support'),
('S13', '22201196', '2024-09-13', 'Mood Survey', 'Good', 'Had a nice weekend, feeling recharged'),
('S14', '22201190', '2024-10-14', 'Stress Survey', 'Anxious', 'Worrying about future plans, feeling overwhelmed'),
('S15', '22201214', '2024-11-15', 'Satisfaction Survey', 'Excited', 'Looking forward to the holidays, feeling good'),
('S16', '22201207', '2024-12-16', 'Stress Survey', 'Happy', 'Feeling relaxed and accomplished, stress is under control.'),
('S17', '22201207', '2024-07-17', 'Mood Survey', 'Good', 'Feeling balanced and calm, enjoying the day.'),
('S18', '22201206', '2024-06-18', 'Behavioral Survey', 'Neutral', 'No significant changes in behavior, just an average day.'),
('S19', '22201206', '2024-05-19', 'Mood Survey', 'Excited', 'Looking forward to upcoming activities, feeling energized.'),
('S20', '22201206', '2024-10-20', 'Behavioral Survey', 'Anxious', 'Worried about upcoming deadlines, feeling unsettled.'),
('S21', '22201197', '2024-05-21', 'Stress Survey', 'Good', 'Stress levels are low, feeling positive and focused.'),
('S22', '22201202', '2024-02-22', 'Stress Survey', 'Happy', 'Feeling confident and stress-free, in a great mood.'),
('S23', '22201204', '2024-02-23', 'Satisfaction Survey', 'Neutral', 'Feeling neither good nor bad, staying steady.'),
('S24', '22201205', '2024-01-24', 'Satisfaction Survey', 'Sad', 'Feeling a bit down, could use some encouragement.'),
('S25', '22201204', '2024-12-25', 'Mood Survey', 'Good', 'Feeling content and optimistic about recent progress.'),
('S26', '22201213', '2024-01-05', 'Mood Survey', 'Good', ''),
('S27', '22201219', '2024-02-15', '', 'Neutral', ''),
('S28', '22201218', '2024-03-20', 'Satisfaction Survey', 'Stressed', ''),
('S29', '22201217', '2024-04-25', '', 'Happy', '')





select * from Student_mental_health_survey


insert into Therapist (therapist_id, first_name, last_name, email, salary) values
('Th001', 'Dr. Rina', 'Sarkar', 'rina@example.com', 50000),
('Th002', 'Dr. Kabir', 'Rahman', 'kabir@example.com', 55000),
('Th003', 'Dr. Liza', 'Ahmed', 'liza@example.com', 60000),
('Th004', 'Dr. Nazma', 'Begum', 'nazma@example.com', 45000),
('Th005', 'Dr. Shahid', 'Alam', 'shahid@example.com', 52000)


select * from Therapist


insert  into Student_therapy_session (session_id, student_id, therapist_id, session_date, duration, session_reports)  values
('SS1', '22201207', 'Th001', '2024-11-01', 60, 'Student discussed recent mood swings'),
('SS2', '22201206', 'Th002', '2024-10-02', 45, 'Therapist helped with stress management'),
('SS3', '22201208', 'Th003', '2024-11-03', 50, 'Student needs more motivation'),
('SS4', '22201209', 'Th004', '2024-09-04', 70, 'Therapist provided techniques to handle anxiety'),
('SS5', '22201216', 'Th005', '2024-08-05', 60, 'Student feels more confident after the session'),
('SS6', '22201197', 'Th005', '2024-08-06', 55, 'Focus on relaxation exercises'),
('SS7', '22201202', 'Th004', '2024-05-07', 65, 'Discussed student’s fears about exams'),
('SS8', '22201200', 'Th003', '2024-01-08', 50, 'Therapist suggested stress relief activities'),
('SS9', '22201205', 'Th002', '2024-12-09', 75, 'Dealt with student’s frustration and anger'),
('SS10', '22201204', 'Th001', '2024-04-10', 60, 'Therapist guided through coping strategies'),
('SS11', '22201203', 'Th003', '2024-03-11', 45, 'Session focused on building self-confidence'),
('SS12', '22201220', 'Th005', '2024-02-12', 55, 'Worked on emotional regulation techniques'),
('SS13', '22201196', 'Th002', '2024-09-13', 65, 'Discussed career anxiety and how to manage'),
('SS14', '22201190', 'Th004', '2024-10-14', 50, 'Focused on relaxation and mindfulness exercises'),
('SS15', '22201214', 'Th003', '2024-11-15', 60, 'Therapist discussed relaxation strategies'),
('SS16', '22201207', 'Th001', '2024-12-16', 60, 'Therapist provided stress-reduction techniques'),
('SS17', '22201207', 'Th003', '2024-07-17', 55, 'Student shared recent improvements in mood management'),
('SS18', '22201206', 'Th002', '2024-06-18', 50, 'Worked on improving focus and reducing distractions'),
('SS19', '22201206', 'Th004', '2024-05-19', 60, 'Helped with strategies to maintain excitement for future plans'),
('SS20', '22201206', 'Th005', '2024-10-20', 70, 'Therapist addressed anxiety related to project deadlines'),
('SS21', '22201197', 'Th002', '2024-05-21', 50, 'Guided through stress-relief practices and positive thinking'),
('SS22', '22201202', 'Th004', '2024-02-22', 60, 'Therapist encouraged confidence building for better stress management'),
('SS23', '22201204', 'Th003', '2024-02-23', 55, 'Discussed strategies for handling neutral emotions effectively'),
('SS24', '22201205', 'Th005', '2024-01-24', 70, 'Therapist provided guidance to overcome disappointment'),
('SS25', '22201204', 'Th001', '2024-12-25', 60, 'Session helped in maintaining good progress and positivity');

select * from Student_therapy_session


insert into Diagnosis (diagnosis_report, diagnosis_id, student_id, diagnosis_date, diagnosis_code) values
('Anxiety', 'D001', '22201207', '2024-01-05', 'A001'),
('Depression', 'D002', '22201206', '2024-02-10', 'D001'),
('Stress', 'D003', '22201208', '2024-03-15', 'S001'),
('PTSD', 'D004', '22201209', '2024-04-20', 'P001'),
('Bipolar Disorder', 'D005', '22201216', '2024-05-25', 'B001'),
('General Anxiety', 'D006', '22201197', '2024-06-30', 'G001'),
('OCD', 'D007', '22201202', '2024-07-05', 'O001'),
('Stress', 'D008', '22201200', '2024-08-10', 'S001'),
('Depression', 'D009', '22201205', '2024-09-15', 'D001'),
('Stress', 'D010', '22201204', '2024-10-20', 'S001'),
('Anxiety', 'D011', '22201203', '2024-11-25', 'A001'),
('Bipolar Disorder', 'D012', '22201220', '2024-12-30', 'B001'),
('Anxiety', 'D013', '22201196', '2024-01-15', 'A001'),
('OCD', 'D014', '22201190', '2024-02-25', 'O001'),
('Depression', 'D015', '22201214', '2024-03-10', 'D001')

select * from Diagnosis


insert into Student_medical_history (student_id, medical_report, medical_record_type, record_date)
values
('22201207', 'MR001', 'History of Panic Attacks', '2024-06-16'),
('22201206', 'MR002', 'Stress-Related Physical Symptoms', '2024-07-21'),
('22201208', 'MR003', 'Family History of Depression', '2024-08-12'),
('22201209', 'MR004', 'Childhood Trauma', '2024-09-06'),
('22201216', 'MR005', 'History of Mood Swings', '2024-03-02'),
('22201197', 'MR006', 'Chronic Stress History', '2024-05-11'),
('22201202', 'MR007', 'Obsessive Thoughts', '2024-05-23'),
('22201200', 'MR008', 'Phobia History', '2024-01-16'),
('22201205', 'MR009', 'Sleep Disturbance Reports', '2024-07-13'),
('22201220', 'MR010', 'Social Withdrawal Episodes', '2024-06-02'),
('22201196', 'MR011', 'Recurrent Headaches', '2024-08-23'),
('22201190', 'MR012', 'Difficulty Concentrating', '2024-05-19'),
('22201214', 'MR013', 'Emotional Regulation Issues', '2024-06-11'),
('22201207', 'MR014', 'History of Panic Attacks', '2024-05-13'),
('22201216', 'MR015', 'Anger Management History', '2024-08-15');


select * from Student_medical_history


INSERT INTO Treatment (treatment_id, diagnosis_id, diagnosis_report, medical_report, treatment_plan, start_date, end_date)
VALUES
('T001', 'D001', 'Anxiety', 'MR001', 'Cognitive Behavioral Therapy', '2024-01-10', '2024-03-10'),
('T002', 'D002', 'Depression', 'MR002', 'Medication and Counseling', '2024-02-15', '2024-04-15'),
('T003', 'D003', 'Stress', 'MR003', 'Relaxation Techniques and Therapy', '2024-03-20', '2024-05-20'),
('T004', 'D004', 'PTSD', 'MR004', 'Exposure Therapy and Support Groups', '2024-04-25', '2024-06-25'),
('T005', 'D005', 'Bipolar Disorder', 'MR005', 'Medication and Therapy', '2024-05-30', '2024-07-30'),
('T006', 'D006', 'General Anxiety', 'MR006', 'CBT and Medication', '2024-07-10', '2024-09-10'),
('T007', 'D007', 'OCD', 'MR007', 'Exposure and Response Prevention Therapy', '2024-07-10', '2024-09-10'),
('T008', 'D008', 'Stress', 'MR008', 'Mindfulness and Counseling', '2024-08-15', '2024-10-15'),
('T009', 'D009', 'Depression', 'MR009', 'Medication and Therapy', '2024-09-20', '2024-11-20'),
('T020', 'D010', 'Stress', 'MR010', 'Stress Management Therapy', '2024-10-25', '2024-12-25'),
('T011', 'D011', 'Anxiety', 'MR011', 'CBT and Medication', '2024-11-30', '2025-01-30'),
('T012', 'D012', 'Bipolar Disorder', 'MR012', 'Medication Adjustment and Therapy', '2024-12-05', '2025-02-05'),
('T013', 'D013', 'Anxiety', 'MR013', 'CBT and Relaxation Exercises', '2024-01-20', '2024-03-20'),
('T014', 'D014', 'OCD', 'MR014', 'CBT and Exposure Therapy', '2024-02-28', '2024-04-28'),
('T015', 'D015', 'Depression', 'MR015', 'Cognitive Therapy and Medication', '2024-03-15', '2024-05-15');



select * from Treatment



INSERT INTO Medication (medication_id, student_id, medication_name, dosage, start_date, end_date, medication_side_effect)
VALUES
('M001', '22201207', 'Diazepam', '5mg', '2024-11-02', '2025-05-02', 'Drowsiness'),
('M002', '22201206', 'Fluoxetine', '20mg', '2024-10-03', '2025-04-03', 'Nausea'),
('M003', '22201208', 'Alprazolam', '0.5mg', '2024-11-04', '2025-05-04', 'Drowsiness'),
('M004', '22201209', 'Sertraline', '50mg', '2024-09-05', '2025-03-05', 'Dry Mouth'),
('M005', '22201216', 'Lithium', '300mg', '2024-08-06', '2025-08-06', 'Weight Gain'),
('M006', '22201197', 'Lorazepam', '2mg', '2024-08-07', '2025-08-07', 'Dizziness'),
('M007', '22201202', 'Clomipramine', '25mg', '2024-06-08', '2025-06-08', 'Headache'),
('M008', '22201200', 'Duloxetine', '30mg', '2024-02-09', '2025-08-09', 'Fatigue'),
('M009', '22201205', 'Venlafaxine', '75mg', '2024-12-10', '2025-06-10', 'Nausea'),
('M010', '22201204', 'Paroxetine', '10mg', '2024-04-10', '2025-04-10', 'Sleep Disturbance'),
('M011', '22201203', 'Buspirone', '10mg', '2024-03-13', '2025-03-13', 'Dizziness'),
('M012', '22201220', 'Olanzapine', '5mg', '2024-12-08', '2025-12-08', 'Weight Gain'),
('M013', '22201196', 'Citalopram', '20mg', '2024-09-14', '2025-03-14', 'Nausea'),
('M014', '22201190', 'Fluoxetine', '20mg', '2024-10-21', '2025-04-21', 'Fatigue'),
('M015', '22201214', 'Trazodone', '50mg', '2024-11-16', '2025-05-16', 'Drowsiness'),
('M016', '22201190', 'Escitalopram', '10mg', '2024-12-21', '2025-12-21', 'Headache'),
('M017', '22201196', 'Aripiprazole', '15mg', '2024-09-26', '2025-03-26', 'Fatigue'),
('M018', '22201214', 'Mirtazapine', '30mg', '2024-06-20', '2025-06-20', 'Weight Gain'),
('M019', '22201206', 'Quetiapine', '25mg', '2024-06-11', '2025-06-11', 'Dry Mouth'),
('M020', '22201207', 'Sertraline', '100mg', '2024-10-26', '2025-04-26', 'Drowsiness'),
('M021', '22201205', 'Lamotrigine', '50mg', '2024-05-26', '2025-05-26', 'Rash'),
('M022', '22201208', 'Duloxetine', '60mg', '2024-02-23', '2025-08-23', 'Dizziness'),
('M023', '22201209', 'Lithium', '400mg', '2024-08-11', '2025-08-11', 'Nausea'),
('M024', '22201197', 'Fluvoxamine', '25mg', '2024-01-26', '2025-01-26', 'Insomnia'),
('M025', '22201202', 'Buspirone', '15mg', '2024-12-26', '2025-06-26', 'Lightheadedness');



select * from Medication



insert into Student_assessment (assessment_id, student_id, assessment_start_date, assessment_end_date, assessment_type) values
('A001', '22201207', '2024-01-10', '2024-01-17', 'Psychological Assessment'),
('A002', '22201206', '2024-02-15', '2024-02-22', 'Depression Screening'),
('A003', '22201208', '2024-03-20', '2024-03-27', 'Stress Evaluation'),
('A004', '22201209', '2024-04-25', '2024-05-02', 'PTSD Assessment'),
('A005', '22201216', '2024-05-30', '2024-06-06', 'Bipolar Disorder Assessment'),
('A006', '22201197', '2024-06-10', '2024-06-17', 'Anxiety Screening'),
('A007', '22201202', '2024-07-06', '2024-07-13', 'OCD Screening'),
('A008', '22201200', '2024-08-11', '2024-08-18', 'Stress Assessment'),
('A009', '22201205', '2024-09-16', '2024-09-23', 'Depression Screening'),
('A010', '22201204', '2024-10-21', '2024-10-28', 'Stress Evaluation'),
('A011', '22201203', '2024-11-26', '2024-12-03', 'Anxiety Assessment'),
('A012', '22201220', '2024-12-01', '2024-12-08', 'Bipolar Disorder Evaluation'),
('A013', '22201196', '2024-01-25', '2024-02-01', 'Anxiety Screening'),
('A014', '22201190', '2024-02-28', '2024-03-06', 'OCD Screening'),
('A015', '22201214', '2024-03-15', '2024-03-22', 'Depression Screening')

select * from Student_assessment


INSERT INTO Student_observation (observation_id, student_id, observation_date, observation_type, observation_report)
VALUES
('O001', '22201207', '2024-01-10', 'Behavioral', 'Student appears anxious and withdrawn'),
('O002', '22201206', '2024-02-12', 'Mood', 'Student has been feeling down and exhausted'),
('O003', '22201208', '2024-03-16', 'Behavioral', 'Student has been showing signs of anxiety'),
('O004', '22201209', '2024-04-21', 'Mood', 'Student often shows signs of frustration and sadness'),
('O005', '22201216', '2024-05-26', 'Behavioral', 'Student appears more energetic and positive'),
('O006', '22201197', '2024-06-02', 'Mood', 'Student has been showing signs of anxiety'),
('O007', '22201202', '2024-07-06', 'Behavioral', 'Student’s behavior has been more focused'),
('O008', '22201200', '2024-08-11', 'Mood', 'Student feels better after therapy'),
('O009', '22201205', '2024-09-16', 'Behavioral', 'Student has been showing signs of depression'),
('O010', '22201204', '2024-10-21', 'Mood', 'Student seems to be more energetic'),
('O011', '22201203', '2024-11-26', 'Behavioral', 'Student seems less withdrawn than before'),
('O012', '22201220', '2024-12-01', 'Mood', 'Student has been more positive after sessions'),
('O013', '22201196', '2024-01-25', 'Mood', 'Student seems overwhelmed with studies'),
('O014', '22201190', '2024-02-28', 'Behavioral', 'Student seems to be under a lot of stress'),
('O015', '22201214', '2024-03-15', 'Mood', 'Student seems more positive after therapy'),
('O016', '22201207', '2024-01-17', 'Behavioral', 'Student participated actively and shared experiences'),
('O017', '22201206', '2024-02-19', 'Mood', 'Student engaged well during discussions'),
('O018', '22201208', '2024-04-23', 'Behavioral', 'Student appeared calm and engaged'),
('O019', '22201209', '2024-04-25', 'Mood', 'Student seemed more open to sharing'),
('O020', '22201216', '2024-05-29', 'Behavioral', 'Student actively participated in group activities'),
('O021', '22201197', '2024-05-29', 'Mood', 'Student seemed to connect with peers'),
('O022', '22201202', '2024-07-12', 'Behavioral', 'Student attended and interacted well with the group'),
('O023', '22201200', '2024-08-15', 'Mood', 'Student showed improvement in stress management skills'),
('O024', '22201205', '2024-09-19', 'Behavioral', 'Student expressed interest in self-help strategies'),
('O025', '22201204', '2024-10-25', 'Mood', 'Student was actively involved in group exercises'),
('O026', '22201203', '2024-11-30', 'Behavioral', 'Student participated actively in group discussions'),
('O027', '22201220', '2024-11-05', 'Mood', 'Student appeared to have improved emotional stability'),
('O028', '22201196', '2024-01-25', 'Mood', 'Student participated passively but seemed attentive'),
('O029', '22201190', '2024-03-03', 'Behavioral', 'Student appeared less anxious than before'),
('O030', '22201214', '2024-04-10', 'Mood', 'Student seemed to benefit from peer discussions');


select * from Student_observation

INSERT INTO Mental_Health_problemwise_group (group_name, student_id, group_times, group_performance)
VALUES
('Anxiety Support Group', '22201207', 'Mon, Wed', 10),
('Depression Support Group', '22201206', 'Tue, Thu', 8),
('Stress Relief Group', '22201208', 'Mon, Fri', 6),
('PTSD Recovery Group', '22201209', 'Wed, Sat', 5),
('Bipolar Disorder Group', '22201216', 'Mon, Thu', 7),
('Anxiety Support Group', '22201197', 'Tue, Fri', 9),
('OCD Support Group', '22201202', 'Wed, Fri', 10),
('Stress Management Group', '22201200', 'Mon, Thu', 7),
('Depression Recovery Group', '22201205', 'Tue, Sat', 8),
('Stress Relief Group', '22201204', 'Mon, Thu', 6),
('Anxiety Support Group', '22201203', 'Wed, Sat', 9),
('Bipolar Disorder Group', '22201220', 'Tue, Fri', 7),
('Anxiety Recovery Group', '22201196', 'Mon, Thu', 6),
('OCD Support Group', '22201190', 'Mon, Fri', 8),
('Depression Support Group', '22201214', 'Tue, Thu', 5);

select * from Mental_Health_problemwise_group


insert into Student_attendance (attendance_id, student_id, group_name, attendance_date, group_effects) values
('A1', '22201207', 'Anxiety Support Group', '2024-01-10', 'Student attended and interacted well'),
('A2', '22201206', 'Depression Support Group', '2024-02-12', 'Student appeared tired but engaged'),
('A3', '22201208', 'Stress Relief Group', '2024-03-16', 'Student participated actively'),
('A4', '22201209', 'PTSD Recovery Group', '2024-04-21', 'Student seemed distant during the session'),
('A5', '22201216', 'Bipolar Disorder Group', '2024-05-26', 'Student showed improvement in mood'),
('A6', '22201197', 'Anxiety Support Group', '2024-06-02', 'Student seemed more relaxed'),
('A7', '22201202', 'OCD Support Group', '2024-07-06', 'Student attended actively'),
('A8', '22201200', 'Stress Management Group', '2024-08-11', 'Student appeared more engaged'),
('A9', '22201205', 'Depression Recovery Group', '2024-09-16', 'Student seemed withdrawn'),
('A10', '22201204', 'Stress Relief Group', '2024-10-21', 'Student showed improvements'),
('A11', '22201203', 'Anxiety Support Group', '2024-11-26', 'Student was attentive'),
('A12', '22201220', 'Bipolar Disorder Group', '2024-12-01', 'Student was energetic'),
('A13', '22201196', 'Anxiety Recovery Group', '2024-01-20', 'Student attended passively'),
('A14', '22201190', 'OCD Support Group', '2024-02-28', 'Student seemed stressed'),
('A15', '22201214', 'Depression Support Group', '2024-03-15', 'Student showed enthusiasm'),
('A16', '22201207', 'Anxiety Support Group', '2024-01-17', 'Student participated actively and shared experiences'),
('A17', '22201206', 'Depression Support Group', '2024-02-19', 'Student engaged well during discussions'),
('A18', '22201208', 'Stress Relief Group', '2024-04-23', 'Student appeared calm and engaged'),
('A19', '22201209', 'PTSD Recovery Group', '2024-04-25', 'Student seemed more open to sharing'),
('A20', '22201216', 'Bipolar Disorder Group', '2024-05-29', 'Student actively participated in group activities'),
('A21', '22201197', 'Anxiety Support Group', '2024-05-29', 'Student seemed to connect with peers'),
('A22', '22201202', 'OCD Support Group', '2024-07-12', 'Student attended and interacted well with the group'),
('A23', '22201200', 'Stress Management Group', '2024-08-15', 'Student showed improvement in stress management skills'),
('A24', '22201205', 'Depression Recovery Group', '2024-09-19', 'Student expressed interest in self-help strategies'),
('A25', '22201204', 'Stress Relief Group', '2024-10-25', 'Student was actively involved in group exercises'),
('A26', '22201203', 'Anxiety Support Group', '2024-11-30', 'Student participated actively in group discussions'),
('A27', '22201220', 'Bipolar Disorder Group', '2024-11-05', 'Student appeared to have improved emotional stability'),
('A28', '22201196', 'Anxiety Recovery Group', '2024-01-25', 'Student participated passively but seemed attentive'),
('A29', '22201190', 'OCD Support Group', '2024-03-03', 'Student appeared less anxious than before'),
('A30', '22201214', 'Depression Support Group', '2024-04-10', 'Student seemed to benefit from peer discussions');


select * from Student_attendance

insert into Emergency_intervention (emergency_id, student_id, intervention_date, intervention_type, intervention_outcome, comments) values
('E001', '22201207', '2024-01-10', 'Anxiety Attack', 'Student calmed down after intervention', 'Therapist suggested relaxation techniques'),
('E002', '22201206', '2024-02-12', 'Depression', 'Student responded well to medication adjustment', 'Medication change to help with fatigue'),
('E003', '22201208', '2024-03-16', 'Panic Attack', 'Student was referred to a therapist for CBT', 'Emergency session helped with panic symptoms'),
('E004', '22201209', '2024-04-21', 'Stress', 'Student showed improvement after relaxation exercises', 'Suggested mindfulness techniques for stress reduction'),
('E005', '22201216', '2024-05-26', 'Bipolar Disorder', 'Student stabilized with medication adjustment', 'Therapist will continue monitoring progress'),
('E006', '22201197', '2024-06-02', 'Anxiety Attack', 'Student calmed after breathing exercises', 'Emergency session to control anxiety levels'),
('E007', '22201202', '2024-07-06', 'OCD Episode', 'Student was guided through coping strategies', 'Suggested extended therapy sessions'),
('E008', '22201200', '2024-08-11', 'Stress', 'Student felt more in control after session', 'Recommended daily relaxation exercises'),
('E009', '22201205', '2024-09-16', 'Depression Crisis', 'Student improved after talking therapy', 'Therapist provided emotional support'),
('E010', '22201204', '2024-10-21', 'Stress Crisis', 'Student showed signs of recovery after intervention', 'Additional stress management techniques suggested'),
('E011', '22201203', '2024-11-26', 'Anxiety Episode', 'Student relaxed after guided intervention', 'Ongoing support planned'),
('E012', '22201220', '2024-12-01', 'Mood Swings', 'Student felt calmer after medication adjustment', 'Therapist will track mood changes and adjust treatment'),
('E013', '22201196', '2024-01-20', 'Anxiety Attack', 'Student calmed with intervention', 'Breathing techniques suggested for future episodes'),
('E014', '22201190', '2024-02-28', 'OCD Episode', 'Student became calmer after emergency therapy', 'Suggested continuing with exposure therapy'),
('E015', '22201214', '2024-03-15', 'Depression Crisis', 'Student responded well to therapy', 'Therapist suggested cognitive restructuring and medication adjustment')


select * from Emergency_intervention


                             ---arithmetic---------

--Calculate the annual salary of each therapist.

select therapist_id,first_name, last_name,salary*12 as annual_salary from Therapist


--Calculate the new salary for each therapist after a 10% raise

select therapist_id,first_name, last_name,salary*1.10 as new_salary from Therapist

--query to print each therapist's ID, name, and salary after 6 years, while accounting for a monthly tax deduction of 1000.

select therapist_id, first_name as name,salary, (salary * 12 * 6) - (1000 * 12 * 6) AS salary_after_6_years 
from Therapist


                              ---where, between, in based:-------------

---Find all students who are male and were born after January 1, 2000.
select student_id, name, date_of_birth, gender
from Student
where gender = 'Male' and date_of_birth > '2000-01-01'


---Find all details of medications from the Medication table where the start_date falls between February 1, 2024, and August 1, 2024."
select * 
from Medication
where  start_date between '2024-04-02' and '2024-08-01';

--Query to find therapists whose IDs are th001,th003,th005:
select therapist_id, first_name, last_name, salary from Therapist where therapist_id in ('th001', 'th003', 'th005')

--Retrieve all survey records where either the survey type or the comment is missing.

select * from Student_mental_health_survey
where survey_type is null or comment = ''




         ----------rename--------
		 
---Find the medication_side_effect column from the Medication table and display it with the Side_Effect.
select  
      medication_name, medication_side_effect as Side_Effect
from Medication



--query to find the names of all therapists who have a higher salary than at least one other therapist

select distinct T.first_name, T.last_name,T.salary
from Therapist as T, Therapist as S
where T.salary > S.salary


               --string based:--------

---Find diagnosis report, diagnosis ID, student ID, and diagnosis code
--from the Diagnosis table where the diagnosis report starts with the letter 'A'

select diagnosis_report, diagnosis_id, student_id, diagnosis_code
from  Diagnosis
where diagnosis_report like 'A%'


----query to find the mental health problem-wise groups that start with the letters 'a', 'b', 'd', or 'o'

select group_name from Mental_Health_problemwise_group where group_name like '[abdo]%'


-- find the mental health problem-wise groups that do not start with the letters 'a', 'b', 'd', or 'o'

select * from Mental_Health_problemwise_group where group_name like '[^abdo]%'


---find student ID, name, gender, email, and phone number of students from the Student table who were born after January 1, 1999, and whose name starts with the letter 'M'.
select student_id, name,gender, email, phone
from Student
where date_of_birth > '1999-01-01'
intersect
select  student_id, name, gender, email, phone
from Student
where name like'M%';



             -----ordering----------

---find all details  from the Treatment table and display them in ascending order based on the start_date.
select * 
from Treatment
order by start_date asc;


---Find all records from the Mental_Health_problemwise_group table where the group_performance \
--is less than 10, and display them in descending order based on group_performance.
select * 
from Mental_Health_problemwise_group
where group_performance<10
order by group_performance desc



   -----set operation-------

---Find  diagnosis report, diagnosis ID, student ID, and diagnosis code from 
--the Diagnosis table where the diagnosis_report gives  the word 'Depression' or the diagnosis code is 'B001'
select diagnosis_report, diagnosis_id, student_id, diagnosis_code
from  Diagnosis
where diagnosis_report like '%Depression%'
union
select  diagnosis_report, diagnosis_id, student_id, diagnosis_code
from  Diagnosis
where  diagnosis_code = 'B001';
---Find diagnosis report, diagnosis ID, student ID, and diagnosis code
--from the Diagnosis table where the diagnosis report starts with the letter 'A' or the diagnosis code is 'D001'."
select diagnosis_report, diagnosis_id, student_id, diagnosis_code
from  Diagnosis
where diagnosis_report like 'A%'
union
select  diagnosis_report, diagnosis_id, student_id, diagnosis_code
from  Diagnosis
where  diagnosis_code = 'D001';

--Find the names of all students who have both a mental health survey record and a diagnosis.
select name 
from Student 
where student_id in (select student_id from Student_mental_health_survey)
intersect
select name 
from Student 
where student_id in (select student_id from Diagnosis)




----Aggregate,group by----------
---find the average salary of all therapists

select
    avg(salary) as average_salary
from
    Therapist
---find maximum age of students, grouped by gender

	select gender, 
     
       max(age) as max_age
from Student
group by gender


---Find the number of therapy sessions attended by each student, grouped by student ID.
select student_id, count(session_id) as session_count
from Student_therapy_session
group by student_id

--Find the average duration of therapy sessions

select avg(duration) as avg_duration 
from Student_therapy_session;


---Find the maximum and minimum duration of therapy sessions.

select max(duration) as max_duration, min(duration) as min_duration 
from Student_therapy_session;

--Find the average duration of therapy sessions for each therapist, but only include therapists who have conducted more than 4 sessions.
select therapist_id, avg(duration) as avg_duration
from Student_therapy_session
group by therapist_id
having count(session_id) > 4;


--Find the number of students for each diagnosis.
select diagnosis_report, count(student_id) as student_count 
from Diagnosis 
group by diagnosis_report;
	

---Find the total duration of therapy sessions conducted by the therapist with ID 'Th001'.

SELECT SUM(duration) AS Total_Duration FROM Student_therapy_session WHERE therapist_id = 'Th001';




--nested subqueries--------

---Find the Names of Therapists with a Salary Higher than the Average Salary
select first_name, last_name, salary 
from Therapist 
where salary > (select avg(salary) from Therapist)


--Find the Names of Students Who Attended the Most Recent Therapy Session

select name 
from Student 
where student_id in (select student_id from Student_therapy_session where session_date = (select max(session_date) from Student_therapy_session))

--Find the Therapists Who Have Conducted the Highest Number of Therapy Sessions

select therapist_id,first_name, last_name 
from Therapist 
where therapist_id in (select therapist_id from Student_therapy_session 
group by therapist_id 
having count(session_id) = (select max(session_count) 
from (select therapist_id, count(session_id) as session_count 
from Student_therapy_session 
group by therapist_id) as Temp))


---Find the Names of Students Diagnosed with Condition 'Anxiety' and Who Also Have Attended Therapy Sessions
select name 
from Student 
where student_id in (select student_id from Diagnosis where diagnosis_report = 'Anxiety')
  and student_id in (select student_id from Student_therapy_session)

--cartesian
--Generate a list of all possible pairs of students and therapists, showing the student name and therapist name.

select Student.name as student_name, Therapist.first_name as therapist_first_name, Therapist.last_name as therapist_last_name
from Student, Therapist

--Find the names of all students who have attended any therapy session along with the session date

select Student.name, Student_therapy_session.session_date
from Student, Student_therapy_session
where Student.student_id = Student_therapy_session.student_id








---Find the students who had therapy sessions in the month of January 2024:
select student_id,name from student
where student_id in(select student_id from Student_therapy_session where session_date between '2024-01-01' and '2024-01-31')













select name 
from Student 
where student_id  not in (select student_id from Student_mental_health_survey where survey_type = 'Mood Survey');


----join

---Get students with their survey details
select Student.name,Student_mental_health_survey.survey_date, Student_mental_health_survey.survey_type 
from Student 
inner join   Student_mental_health_survey 
on   Student.student_id = Student_mental_health_survey.student_id


--- Get student diagnosis and treatment details

select d.student_id,d.diagnosis_report,t.treatment_plan 
from diagnosis as d

inner join treatment as t
on d.diagnosis_id = t.diagnosis_id
    

