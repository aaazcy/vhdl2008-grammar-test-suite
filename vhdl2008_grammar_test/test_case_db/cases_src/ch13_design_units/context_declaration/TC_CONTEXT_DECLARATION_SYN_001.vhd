-- =============================================================
-- Case ID: TC_CONTEXT_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_declaration ::= context identifier is context_clause end [ context ] [ context_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Context declaration with library+use clauses: the context contains a library clause and multiple use clauses (including .all), verifying the complete VHDL 2008 context_declaration syntax — reusable as a collection of context_items
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
context ctx_test is
  library ieee;
  use ieee.std_logic_1164.all;
  use std.standard.all;
end context ctx_test;
entity ctx_ent is port(a:in integer; y:out integer); end entity;
architecture bh of ctx_ent is begin y<=a; end architecture bh;
