-- =============================================================
-- Case ID: TC_INDEX_CONSTRAINT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_constraint ::= ( discrete_range { , discrete_range } )
-- Case Type: Positive
-- Test Focus: index_constraint with downto direction ranges
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ic_syn_downto is port(dout:out integer); end entity;
architecture rtl of ic_syn_downto is
  type t_vec is array(integer range <>) of integer;
  subtype t_vec_rev is t_vec(7 downto 0);
  signal s:t_vec_rev:=(others=>0);
begin s(7)<=42; dout<=s(7); end architecture;