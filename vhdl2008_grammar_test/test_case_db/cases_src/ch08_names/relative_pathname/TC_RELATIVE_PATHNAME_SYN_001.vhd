-- =============================================================
-- Case ID: TC_RELATIVE_PATHNAME_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIVE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: relative_pathname ::= { ^ . } partial_pathname
-- Case Type: Positive
-- Test Focus: Relative pathname with upward ^ traversal——`^.^.partial_pathname` walks up the hierarchy via ^, the relative path reference of a VHDL 2008 external name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rp_ent is port(y:out integer); end entity;
architecture bh of rp_ent is
  signal s_local:integer:=42;
begin
  -- In external name: <<signal ^.rp_ent.bh.s_local : integer>>
  -- relative_pathname = ^.rp_ent.bh.s_local (one level up then down)
  y<=s_local;
end architecture bh;
