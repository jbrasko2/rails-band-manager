Band Manager App

Manager
	has_many :bands
	- username
	- email
	- password_digest
	- uid
	- provider

Band
	belongs_to :manager
	has_many :band_members
	has_many :members, through: :band_members
	- name
	- manager_id

BandMember
	belongs_to :band
	belongs_to :member
	- instrument
	- band_id
	- member_id

Member
	has_many :band_members
	has_many :bands, through: :band_members
	- name
