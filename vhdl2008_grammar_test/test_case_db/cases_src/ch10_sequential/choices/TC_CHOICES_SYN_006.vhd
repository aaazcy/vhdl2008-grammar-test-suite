-- =============================================================
-- Case ID: TC_CHOICES_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choices ::= choice { | choice }
-- Case Type: Positive
-- Test Focus: choices: mixed simple_expression and discrete_range with pipe separator combined with others in selected signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity choices_syn6_ent is port(sel:in integer range 0 to 15; y:out integer); end entity;
architecture bh of choices_syn6_ent is
begin
  with sel select y <=
    10  when 0|1|2,
    20  when 3 to 5|8,
    30  when 6|7|9 to 11,
    40  when others;
end architecture bh;
