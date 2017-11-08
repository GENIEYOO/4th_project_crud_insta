~~~shell
gem install sinatra
gem install thin
gem install dm-sqlite-adapter #gem install data_mapper이 아님!
# gem install data_mapper dm-sqlite-adpater이런식으로 써도 무방하다 근데 에러난다
# https://github.com/sinatra/sinatra/issues/1294
데이터 매퍼가 거지같이 바껴서 다른거 쓰겠다!
~~~

#### thin의 역할

- 도메인이 http://www.naver.com/search로 있을 때
  -  www.naver.com이 우리가 요청 보낼 주소 
  - search가 행위 
  - http는 프로토콜
- apache tomcat의 역할은 thin이
- jsp의 역할은 sinatra가 한다.

#### 데이터베이스를 쓰는 이유

- 빠르고 저장이 편해서일 뿐...
- 우리는 ORM을 쓸거임!(OOP 언어와 데이터를 다루는 RDBMS 와의 상이한 시스템을 매핑하여, 쉽게 데이터 관련 [OOP](http://en.wikipedia.org/wiki/Object-oriented_programming) 프로그래밍을 쉽게 하도록 하기 위한 기술이다)
- SQLite는 파일 하나로 저장된다. 
- http://recipes.sinatrarb.com/p/models/data_mapper

#### 레일즈 프로젝트 생성

~~~shell
rails g controller post  #g는 generator의 약자이다.
rails g model post
rake db:migrate   #데이터베이스 테이블을 만듦 , db/schema.rb에서 확인가능하다.
				  #이후에 실행하면 자동 insert문이 생성되어 디비에 저장된다. 
				  #편리! 이거시 바로 ORM!
				  
#디비에 저장된걸 확인하려면....
rails c  #rails console 레일즈를 위한 irb라고 생각하면 된다.
Post.all #SELECT * FROM Post와 같다.
pp Post.all #pretty print의 약자. 이쁘게 보여준다.

#이것도 보기 별로니 visualize해주는 서비스를 이용하자
#Gemfile에 들어가서 gem 'rails_db'를 해준다. 그리고 서버 꺼주고
bundle_install   #하고 다시 서버 시작
#https://crud-insta-ptytoo.c9users.io/rails/db 로 들어가면 디비확인 가능

rails c
Post.all
Post.first
Post.last

~~~

- restful api
- curl
  - 다양한 통신 프로토콜을 이용하여 데이터를 전송하기 위한 라이브러리와 명령 줄 도구를 제공하는 컴퓨터 소프트웨어 프로젝트이다

~~~ru
irb
num = 20
num.=(20)   #위와 같은 의미이다.
5 * 3 # 5.*(3)과 같은 의미
~~~

~~~shell
gem install pry
gem install awesome_print
pry
def simple
	puts "no parens"
end
#return이라는 말도 안쓴다. 써도 에러는 아님
def subtract(one, two)
	ont - two
end
simple

#추가 설명
?  #예측하기 위한 메소드
!  #원래 있는 객체를 변화시킬 때 사용한다.
str = "hello world"
str.gsub("hello","hi")
str.gsub!("hello","hi")

123.zero?
~~~

- ruby blocks

  - yield 양도 양보함

  - ~~~SHELL
    def hack
    	puts "Hack"
    	yield
    end

    hack   #에러

    hack {puts "your life"}

    [1,2,3,4].each {|x| puts x}

    class Array
    	def each

    class Numeric
    	def bitcoin
    		self * 8380000
    	end
    end

    20.bitcoin
    ~~~

- TDD란? (요즘은 BDD라고 한다. 행동 주도 어쩌고...)

  - 테스트를 먼저 짜고, 개발을 시작하는 것    -끝-

