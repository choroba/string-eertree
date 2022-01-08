package String::Eertree::Node;

=head1 String::Eertree::Node

=cut

use Moo;

has length     => (is => 'ro',  required => 1);
has pos        => (is => 'rwp', required => 1);
has link       => (is => 'rwp');
has edge       => (is => 'lazy', predicate => 1, builder => sub { {} }, );
has count      => (is => 'rwp', default => 1);
has step_tally => (is => 'rwp', default => 1);

sub increment_count {
    my ($self, $count) = @_;
    $self->_set_count(($count // 1) + $self->count);
}

sub string {
    my ($self, $eertree) = @_;
    return substr $eertree->string, $self->pos, $self->length
}

__PACKAGE__
