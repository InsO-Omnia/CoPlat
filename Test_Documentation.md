# Test Documentation
(for CoPlat)

## File Tree
--- base
     | --- base
     |      | --- settings.py
     |      | --- urls.py
     |      | --- wsgi.py
     |    
     | --- CoPlat
            | --- migrations
            |         | ------ 0001_initial.py
            |                        
            | --- media 
            |       | --- Coursework 
            |       |         | ------ 
            |       |
            |       | --- Resource
            |                 | --- 
            | --- static 
            |       | --- jscss 
            |       |         | ------ 
            |       |
            |       | --- Res
            |                 | --- 
            | --- templates
            |
            |
            | ---  
            |      
            |      
            |      
            |      
            |       
            

## Data for Test
### User Entities
#### Student
Two Student Objects:
- {
      Id = 's11110000',
      username = 's11110000',
      password = '123456',
      first_name = '',
      last_name = '',
  }
  
- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }
#### Teacher
Two Teacher Objects:
- {
      Id = 's11110000',
      username = 's11110000',
      password = '123456',
      first_name = '',
      last_name = '',
  }
  
- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }
  
#### Administrator
One Administrator Objects:
- {
      Id = 's11110000',
      username = 's11110000',
      password = '123456',
      first_name = '',
      last_name = '',
  }
  
### Other Entities 

#### Semester
One Semester Objects:

- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }
  
#### Course
Three Course Objects:
- {
      Id = 's11110000',
      username = 's11110000',
      password = '123456',
      first_name = '',
      last_name = '',
  }
  
- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }

- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }
  
#### Coursework
Three Coursework Objects, one for each Course:
- {
      Id = 's11110000',
      username = 's11110000',
      password = '123456',
      first_name = '',
      last_name = '',
  }
  
- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }

- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }
  
#### Resource
Three Resource Objects, one for each course:
- {
      Id = 's11110000',
      username = 's11110000',
      password = '123456',
      first_name = '',
      last_name = '',
  }
  
- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }

- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }
  
### Relationship 

#### Enrollment
Four Enrollment Objects, two for each student:
- {
      Id = 's11110000',
      username = 's11110000',
      password = '123456',
      first_name = '',
      last_name = '',
  }
  
- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }

- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }

- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }

#### Instruction
Four Instruction Objects:
- {
      Id = 's11110000',
      username = 's11110000',
      password = '123456',
      first_name = '',
      last_name = '',
  }
  
- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }

- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }

- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }

#### Assignment

Four Assignment Objects:
- {
      Id = 's11110000',
      username = 's11110000',
      password = '123456',
      first_name = '',
      last_name = '',
  }
  
- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }

- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }

- {
      Id = 's11110002',
      username = 's00001111',
      password = '654321',
      first_name = '',
      last_name = '',
  }
  
## Results
