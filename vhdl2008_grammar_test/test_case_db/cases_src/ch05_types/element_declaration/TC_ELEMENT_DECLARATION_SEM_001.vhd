-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::= identifier_list : element_subtype_definition ;
-- Case Type: Positive
-- Test Focus: SEMANTIC -- record element accessed via selected name in expressions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ed_sem_access is port(dout:out integer); end entity;
architecture rtl of ed_sem_access is
  type t_pt is record x:integer; y:integer; end record;
  signal s:t_pt:=(x=>10,y=>20);
begin dout<=s.x*s.y; end architecture;