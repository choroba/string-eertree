package String::Eertree::ToDot;
use Moo;
extends 'String::Eertree';

=head1 String::Eertree::ToDot

=cut

sub to_dot {
    my ($self) = @_;
    say 'digraph { rankdir = BT;';
    for my $i (0 .. $self->Last) {
        my $node = $self->node($i);
        say $i, qq([shape=record, label="$i|),
            $node->string($self) || $i - 1, '"]';
        say $i, '->', $node->link, '[color=blue]';
    }
    for my $i (0 .. $self->Last) {
        my $node = $self->node($i);
        for my $ch (keys %{ $node->edge }) {
            say $i, '->', $node->edge->{$ch},
                "[label=$ch, constraint=false]";
        }
    }
    say '}';
}

__PACKAGE__
