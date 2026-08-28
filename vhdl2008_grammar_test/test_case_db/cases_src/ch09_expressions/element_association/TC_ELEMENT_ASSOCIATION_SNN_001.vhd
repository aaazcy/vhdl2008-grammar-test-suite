-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Negative
-- Test Focus: SNN: named association missing =>: in a record aggregate field_a 42 lacks "=>"; the parser expects to see "=>" after the choices but encounters an expression
-- Expected Result: Triggers syntax error: missing "=>" in named element association
-- Dependencies: None
-- =============================================================
entity ea_snn_001 is
  port (
    x : out integer
  );
end entity ea_snn_001;

architecture missing_arrow of ea_snn_001 is
  type t_rec is record
    a, b : integer;
  end record t_rec;
  signal s : t_rec;
begin
  -- ERROR: missing "=>" — choice 'a' is followed directly by 10, not "=>"
  s <= (a 10, b => 20);
  x <= s.a;
end architecture missing_arrow;
