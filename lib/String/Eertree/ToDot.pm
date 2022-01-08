package String::Eertree::ToDot;
use Moo;
extends 'String::Eertree';

=head1 String::Eertree::ToDot

=cut

sub to_dot {
    my ($self) = @_;
    my @lines = ('digraph { rankdir = BT;');
    for my $i (0 .. $self->Last) {
        my $node = $self->node($i);
        push @lines, qq($i [shape=record, label="$i|)
            . ($node->string($self) || $i - 1) . '"]';
        push @lines, $i . '->' . $node->link . '[color=blue]';
    }
    for my $i (0 .. $self->Last) {
        my $node = $self->node($i);
        for my $ch (sort keys %{ $node->edge }) {
            push @lines, $i . '->' . $node->edge->{$ch}
                         . "[label=$ch, constraint=false]";
        }
    }
    push @lines, '}';
    return @lines
}

__PACKAGE__
