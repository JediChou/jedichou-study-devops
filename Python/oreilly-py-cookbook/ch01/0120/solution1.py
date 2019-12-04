# -*- coding: utf-8 -*-
german_ae = unicode('\xc3\xa4', 'utf8')
sentence = "This is a " + german_ae
sentence2 = "Easy!"
para = ". ".join([sentence, sentence2])

print para

# Jedi: 需在Python IDEL中运行，直接在Windows Console中运行会提示错误