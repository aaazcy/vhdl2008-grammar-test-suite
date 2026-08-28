-- =============================================================
-- Case ID: TC_EXTERNAL_PATHNAME_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_pathname ::= package_pathname | absolute_pathname | relative_pathname
-- Case Type: Negative
-- Test Focus: SNN: an illegal prefix that is not one of the three legal path forms — <<constant :path.name : integer>> begins with a colon, which is not one of @ (package) / . (absolute) / ^ (relative); external_pathname accepts only these three prefix forms
-- Expected Result: Triggers syntax error at invalid path prefix
-- Dependencies: None
-- =============================================================
entity ext_path_bad_prefix is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of ext_path_bad_prefix is
  -- ERROR: ':' is not a valid external_pathname prefix (@ . or ^)
  alias bad_ref is <<constant :path.name : integer>>;
begin
  q <= d;
end architecture vhdl2008;
