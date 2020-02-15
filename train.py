#!/usr/bin/env python
import django
import os
from chatterbot import ChatBot
from chatterbot.trainers import ChatterBotCorpusTrainer

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "example_app.settings")
django.setup()

bot = ChatBot('SomeBot',     storage_adapter='chatterbot.storage.DjangoStorageAdapter', django_app_name='django_chatterbot')
trainer = ChatterBotCorpusTrainer(bot)
trainer.train( 'chatterbot.corpus.english')
