FROM busybox:latest
RUN echo "i work"
RUN echo -c "i am not work"
RUN dd if=/dev/zero of=/bigfile count=100K
RUN rm bigfile
