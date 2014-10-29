import rospy
import genpy 
import sys
import rostopic

NAME='simple-action-sender'


def main():
    #rospy.init_node('goal_sender')
    argv = sys.argv
    #argv = rospy.myargv(argv)

    from optparse import OptionParser
    parser = OptionParser(usage="usage: %prog list [/namespace]", prog=NAME)
    parser.add_option("-f",
                      dest="filename", default=None,
                      help="Name of yaml file name of options")
    parser.add_option("-w",
                      dest="timeout", default=3, type="float",
                      help="time to wait for server and response")
    parser.add_option("-t",
                      dest="topicname", default=None)
    parser.add_option("-r",
                       dest="responsetopic", default=None)
    parser.add_option("--topic-type",
                      dest="topictype", default=None)

    (options, args) = parser.parse_args(argv)
    if not options.filename or not options.topicname:
        rospy.logfatal("No yaml file name given")
        sys.exit(-1)


    topictype, topicname, fn = rostopic.get_topic_type(options.topicname, False)


    if not topictype:
        rospy.logerror("Topic not currently subscribed %s"%topicname)


    if not options.topictype and not topictype:
        exit(-1)

    if options.topictype and topictype and options.topictype is not topictype:
        rospy.logerror("Topic type does not agree: topic %s, given type: %s, detected type: %s"
                       % (topicname, options.topictype, topictype))
        exit(-1)

    if options.topictype:
        topictype = options.topictype

    pub, msg_class = rostopic.create_publisher(options.topicname, topictype, False)

    rostopic.stdin_publish(pub, msg_class, 1, True, options.filename, True)

    if options.responsetopic:
        subtype, responsetopic, fn = rostopic.get_topic_class(options.responsetopic, False)
        msg = rospy.wait_for_message(options.responsetopic, subtype, options.timeout)
    print(msg)


if __name__ == "__main__":
    main()
