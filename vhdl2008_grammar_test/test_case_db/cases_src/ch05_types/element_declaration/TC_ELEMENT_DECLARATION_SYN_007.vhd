-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::= identifier_list : element_subtype_definition ;
-- Case Type: Positive
-- Test Focus: element_declaration with bit and boolean fields for flag record
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ed_syn_flags is port(dout:out integer); end entity;
architecture rtl of ed_syn_flags is
  type t_flags is record ready:bit; error:bit; overflow:boolean; end record;
  signal s:t_flags:=(ready=>'0',error=>'0',overflow=>false);
begin s.ready<='1'; dout<=0; end architecture;