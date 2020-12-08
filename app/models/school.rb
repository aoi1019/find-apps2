class School < ActiveHash::Base
  self.data = [
    { id: 1, name: '--- 選択してください ---' },
    { id: 2, name: 'テックキャンプ' },
    { id: 3, name: 'Tech Academy' },
    { id: 4, name: 'Code Camp' },
    { id: 5, name: 'ポテパンキャンプ' },
    { id: 6, name: 'RUNTEQ' },
    { id: 7, name: 'Skill Hacks' },
    { id: 8, name: 'DMM WEBCAMP' },
    { id: 9, name: 'Raise Tech' },
    { id: 10, name: 'Code Village' },
    { id: 11, name: 'tech boost' },
    { id: 12, name: '侍エンジニア塾' },
    { id: 13, name: 'DIVE INTO CODE' },
    { id: 14, name: '独学' },
    { id: 15, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :users
end
