-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: array_type_definition ::= constrained_array_definition | unbounded_array_definition
-- Case Type: Positive
-- Test Focus: Array full forms: constrained 1D(bit_vector-like) / constrained 2D(matrix) / unbounded 1D(integer range <>) / unbounded 2D(integer range <>, boolean range <>) / constrained with enum index, verifying both the constrained and unbounded definitions of array and multi-dimensional indexing
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arr_ent is port(y:out integer); end entity;
architecture bh of arr_ent is
  type t_byte   is array(7 downto 0) of bit;
  type t_matrix is array(0 to 3, 0 to 3) of integer;
  type t_vec    is array(integer range <>) of integer;
  type t_grid   is array(integer range <>, boolean range <>) of bit;
  type t_state  is (IDLE,RUN,DONE);
  type t_state_arr is array(t_state) of integer;
  signal s_b:t_byte:=(others=>'0'); signal s_v:t_vec(0 to 7):=(others=>0);
begin
  s_b(0)<='1'; s_v(0)<=42; y<=s_v(0);
end architecture bh;
