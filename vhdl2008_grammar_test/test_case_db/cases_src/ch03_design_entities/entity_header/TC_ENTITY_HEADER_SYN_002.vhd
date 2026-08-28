-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Positive
-- Test Focus: entity_header all combinations — port only: the entity_header of the entity contains only a port_clause(5 ports in all modes in/out/inout/buffer/linkage) and no generic_clause, verifying `[port_clause]` may exist alone and `[generic_clause]` may be omitted — this is the most common entity form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity eh_port_only is
  port(
    a : in  integer;
    b : out integer;
    c : inout bit;
    d : buffer bit;
    e : linkage bit
  );
end entity;
architecture bh of eh_port_only is
begin b <= a; d <= c; end;
