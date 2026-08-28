-- =============================================================
-- Case ID: TC_DISCRETE_RANGE_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_DISCRETE_RANGE
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: discrete_range ::= discrete_subtype_indication | range
-- Case Type: Positive
-- Test Focus: discrete_range using an enumeration type as the index subtype
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dr_syn_enum is port(dout:out integer); end entity;
architecture rtl of dr_syn_enum is
  type t_state is (IDLE,RUN,PAUSE,STOP);
  type t_state_vec is array(t_state range IDLE to STOP) of integer;
  signal s:t_state_vec:=(others=>0);
begin s(IDLE)<=1; dout<=s(IDLE); end architecture;