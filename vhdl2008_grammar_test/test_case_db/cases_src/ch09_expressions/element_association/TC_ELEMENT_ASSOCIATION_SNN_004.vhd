-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Negative
-- Test Focus: SNN: positional after named: in a record aggregate c => 10 (named) is written first and then 20 (positional); VHDL requires all positional associations to precede any named ones
-- Expected Result: Triggers syntax error: positional association cannot follow named association
-- Dependencies: None
-- =============================================================
entity ea_snn_004 is
  port (
    x : out integer
  );
end entity ea_snn_004;

architecture pos_after_named of ea_snn_004 is
  type t_rec is record
    a, b, c : integer;
  end record t_rec;
  signal s : t_rec;
begin
  -- ERROR: positional element '20' follows named element 'c => 10'
  s <= (c => 10, 20, a => 30);
  x <= s.a;
end architecture pos_after_named;
