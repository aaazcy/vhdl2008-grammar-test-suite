-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Positive
-- Test Focus: SEMANTIC -- subtype used in port with range checking
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sd_sem_port is port(addr:in integer range 0 to 255; dout:out integer); end entity;
architecture rtl of sd_sem_port is
  subtype t_addr is integer range 0 to 255;
  signal s:t_addr:=0;
begin s<=addr; dout<=s; end architecture;