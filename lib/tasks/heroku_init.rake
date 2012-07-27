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

    t11=Topic.create :name=>"Art and Music", :subject_id => 1
    t12=Topic.create :name=>"European History", :subject_id => 1
    t13=Topic.create :name=>"U.S. History", :subject_id => 1
    t14=Topic.create :name=>"World History", :subject_id => 1

    t15=Topic.create :name=>"English", :subject_id => 2
    t16=Topic.create :name=>"French", :subject_id => 2
    t17=Topic.create :name=>"Spanish", :subject_id => 2
    t18=Topic.create :name=>"German", :subject_id => 2
    t19=Topic.create :name=>"Italian", :subject_id => 2
    t20=Topic.create :name=>"Japanese", :subject_id => 2

    t1=Topic.create :name=>"Calculus", :subject_id => 3
    t2=Topic.create :name=>"Computer Science", :subject_id => 3
    t3=Topic.create :name=>"Statistics", :subject_id => 3

    t4=Topic.create :name=>"Biology", :subject_id => 4
    t5=Topic.create :name=>"Chemistry", :subject_id => 4
    t6=Topic.create :name=>"Environmental Science", :subject_id => 4
    t7=Topic.create :name=>"Physics", :subject_id => 4

    t8=Topic.create :name=>"Economics", :subject_id => 5
    t9=Topic.create :name=>"Psychology", :subject_id => 5
    t10=Topic.create :name=>"Government", :subject_id => 5

  end

