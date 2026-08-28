-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Negative
-- Test Focus: SEM: duplicate port identifier in formal_port_clause—`port(clk:in bit; rst:in bit; clk:out bit)` declares `clk` twice within the same port clause with different modes; while the BNF syntax for each port declaration is individually valid, the entity header's declarative region must contain unique port identifiers, so the analyzer rejects the duplicate `clk` identifier within the port list
-- Expected Result: Triggers semantic error: duplicate port identifier clk
-- Dependencies: None
-- =============================================================
entity eh_dup_port is
  port(
    clk : in  bit;
    rst : in  bit;
    clk : out bit
  );
end entity eh_dup_port;
