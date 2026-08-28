-- =============================================================
-- Case ID: TC_CONSTRAINT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: constraint ::= range_constraint | array_constraint | record_constraint
-- Case Type: Positive
-- Test Focus: constraint as record_constraint narrowing record field ranges
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity con_syn_record is port(dout:out integer); end entity;
architecture rtl of con_syn_record is
  type t_wide is record a:bit_vector; b:bit_vector; end record;
  subtype t_narrow is t_wide(a(0 to 255), b(0 to 255));
  signal s:t_narrow:=(a=>(others=>'0'), b=>(others=>'0'));
begin s.a<=(others=>'0'); dout<=s.a'length; end architecture;