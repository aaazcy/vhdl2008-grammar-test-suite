-- =============================================================
-- Case ID: TC_INDEX_CONSTRAINT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: index_constraint ::= ( discrete_range { , discrete_range } )
-- Case Type: Positive
-- Test Focus: Index constraint 1D/2D/multi-constraint: bit_vector(7 downto 0) / 2D array(0 to 3,0 to 7) / enum indexed array(t_state range), verifying the 1D, multi-dimensional and enum index full forms of index_constraint
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ic_ent is port(y:out integer); end entity;
architecture bh of ic_ent is
  type t_vec is array(integer range <>) of integer;
  type t_mat is array(integer range <>,integer range <>) of integer;
  signal s_v:t_vec(0 to 7):=(others=>0);
  signal s_m:t_mat(0 to 3,0 to 7):=(others=>(others=>0));
begin
  s_v(0)<=42; s_m(1,2)<=10; y<=s_v(0)+s_m(1,2);
end architecture bh;
