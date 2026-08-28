-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.2.1
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Case Type: Negative (Semantic)
-- Test Focus: Generic map type mismatch — the generic map assigns an integer value to a time-typed formal generic parameter; the types must be compatible for the binding to be semantically valid
-- Expected Result: Triggers semantic error (generic type mismatch)
-- Dependencies: None
-- =============================================================
entity bi_smn1_ent is port(r:out integer); end entity;
architecture bh of bi_smn1_ent is
  component comp_g is
    generic(DLY : time := 1 ns);
    port(x : in integer; y : out integer);
  end component;
  -- ERROR: integer literal '5' assigned to time-typed generic DLY
  for u_g : comp_g use entity work.bi_smn1_ent(bh)
    generic map(DLY => 5);
  signal s:integer:=0;
begin
  u_g : comp_g port map(x=>s, y=>r);
end architecture bh;
