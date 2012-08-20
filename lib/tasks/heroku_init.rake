 namespace :db do
  desc "Initialize remote database with necessary subjects, topics"
  task populate: :environment do
    make_subjects
    make_topics
    # make_colleges
    # make_exams
  end
 end

  def make_subjects
    s1=Subject.create :name => "Art/Humanities"
    s2=Subject.create :name => "Languages/Lit"
    s3=Subject.create :name => "Mathematics" 
    s4=Subject.create :name => "Natural Science" 
    s5=Subject.create :name => "Social Science" 
    s6=Subject.create :name => "Other"
  end 

  def make_topics

    t1=Topic.create :name=>"Art and Music", :subject_id => 1
    t2=Topic.create :name=>"European History", :subject_id => 1
    t3=Topic.create :name=>"U.S. History", :subject_id => 1
    t4=Topic.create :name=>"World History", :subject_id => 1

    t5=Topic.create :name=>"English", :subject_id => 2
    t6=Topic.create :name=>"French", :subject_id => 2
    t7=Topic.create :name=>"Spanish", :subject_id => 2
    t8=Topic.create :name=>"German", :subject_id => 2
    t9=Topic.create :name=>"Italian", :subject_id => 2
    t10=Topic.create :name=>"Japanese", :subject_id => 2

    t11=Topic.create :name=>"Calculus", :subject_id => 3
    t12=Topic.create :name=>"Computer Science", :subject_id => 3
    t13=Topic.create :name=>"Statistics", :subject_id => 3

    t14=Topic.create :name=>"Biology", :subject_id => 4
    t15=Topic.create :name=>"Chemistry", :subject_id => 4
    t16=Topic.create :name=>"Environmental Science", :subject_id => 4
    t17=Topic.create :name=>"Physics", :subject_id => 4

    t18=Topic.create :name=>"Economics", :subject_id => 5
    t19=Topic.create :name=>"Psychology", :subject_id => 5
    t20=Topic.create :name=>"Government", :subject_id => 5

  end

  def make_exams
    apcentral="http://apcentral.collegeboard.com/apc/public/exam/exam_information/"
    e1=Exam.create :name =>'Art History', :url=>apcentral+"2053"
    e2=Exam.create :name =>'Biology', :url=>apcentral+"1996"
    e3=Exam.create :name =>'Calculus AB', :url=>apcentral+"1997"
    e4=Exam.create :name =>'Calculus BC', :url=>apcentral+"8031"
    e5=Exam.create :name =>'Chemistry', :url=>apcentral+"1998"
    e6=Exam.create :name =>'Chinese Lang.', :url=>apcentral+"157009"
    e7=Exam.create :name =>'Computer Science A', :url=>apcentral+"2000"
    e8=Exam.create :name =>'English Lang.', :url=>apcentral+"2001"
    e9=Exam.create :name =>'English Lit.', :url=>apcentral+"2002"
    e10=Exam.create :name =>'Environmental Science', :url=>apcentral+"2003"
    e11=Exam.create :name =>'European History', :url=>apcentral+"2085"
    e12=Exam.create :name =>'French Lang.', :url=>apcentral+"4559"
    e34=Exam.create :name =>'German Lang.', :url=>apcentral+"4556"
    e13=Exam.create :name =>'Government - comparative', :url=>apcentral+"2087"
    e14=Exam.create :name =>'Government - U.S.', :url=>apcentral+"2086"
    e15=Exam.create :name =>'Human Geography', :url=>apcentral+"2004"
    e16=Exam.create :name =>'Italian Lang.', :url=>apcentral+"51775"
    e17=Exam.create :name =>'Japanese Lang.', :url=>apcentral+"157014"
    e18=Exam.create :name =>'Latin', :url=>apcentral+"4558"
    e19=Exam.create :name =>'Macroeconomics', :url=>apcentral+"2083"
    e20=Exam.create :name =>'Microeconomics', :url=>apcentral+"2084"
    e21=Exam.create :name =>'Music Theory', :url=>apcentral+"2006"
    e22=Exam.create :name =>'Physics B', :url=>apcentral+"2007"
    e23=Exam.create :name =>'Physics C: Electricity/Magnetism', :url=>apcentral+"2008"
    e24=Exam.create :name =>'Physics C: Mechanics', :url=>apcentral+"8039"
    e25=Exam.create :name =>'Psychology', :url=>apcentral+"2088"
    e26=Exam.create :name =>'Spanish Lang.', :url=>apcentral+"4554"
    e27=Exam.create :name =>'Spanish Lit.', :url=>apcentral+"2009"
    e28=Exam.create :name =>'Statistics', :url=>apcentral+"8357"
    e29=Exam.create :name =>'Studio Art 2-D', :url=>''
    e30=Exam.create :name =>'Studio Art 3-D', :url=>''
    e31=Exam.create :name =>'Studio Art: Drawing', :url=>''
    e32=Exam.create :name =>'U.S. History', :url=>apcentral+"2089"
    e33=Exam.create :name =>'World History', :url=>apcentral+"2090"
  end