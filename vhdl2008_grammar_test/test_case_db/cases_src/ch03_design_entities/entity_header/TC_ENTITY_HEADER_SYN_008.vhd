-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Positive
-- Test Focus: entity_header with single generic and single port—the simplest non-trivial combination `generic(G_DW:integer:=8); port(din:in bit_vector(G_DW-1 downto 0))`, with the port subtype_indication directly referencing the generic constant declared earlier in the same entity_header, validating the minimal combined form where both optional clauses are present and interact by name resolution across clause boundaries within the header
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity eh_minimal_pair is
  generic(
    G_DW : integer := 8
  );
  port(
    din : in bit_vector(G_DW - 1 downto 0)
  );
end entity eh_minimal_pair;
