FROM cs50/baseimage

USER root

# nltk and punkt data
RUN pip install \
        nltk \
        passlib \
        pytz && \
    python -m nltk.downloader -d /usr/share/nltk_data/ punkt

# check50 wrapper
COPY ./check50-wrapper /usr/local/bin/
RUN chmod a+x /usr/local/bin/check50-wrapper

USER ubuntu

# clone checks
RUN git clone -b master https://github.com/cs50/checks.git ~/.local/share/check50/cs50/checks/

# configure git
RUN git config --global user.name bot50 && \
    git config --global user.email bot@cs50.harvard.edu
