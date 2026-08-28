-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Positive
-- Test Focus: entity_header all combinations — generic only: the entity_header of the entity contains only a generic_clause(3 generics: integer/boolean/time) and no port_clause, verifying `[generic_clause]` may exist alone and `[port_clause]` may be omitted
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity eh_gen_only is
  generic(
    G_DW : integer := 8;
    G_EN : boolean := true;
    G_DL : time    := 1 ns
  );
end entity;
architecture bh of eh_gen_only is
begin
end;
