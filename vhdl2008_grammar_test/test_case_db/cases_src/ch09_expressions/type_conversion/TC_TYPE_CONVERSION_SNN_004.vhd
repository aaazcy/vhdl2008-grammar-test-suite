-- =============================================================
-- Case ID: TC_TYPE_CONVERSION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_CONVERSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.5
-- Production: type_conversion ::= type_mark ( expression )
-- Case Type: Negative
-- Test Focus: SNN: conversion between unrelated types — integer("hello"), there is no defined type conversion path from string to integer
-- Expected Result: Triggers type error: no conversion defined between these unrelated types
-- Dependencies: None
-- =============================================================

entity ent_tc_snn_004 is
  port (y : out integer);
end entity ent_tc_snn_004;

architecture unrelated of ent_tc_snn_004 is
begin
  -- ERROR: Cannot convert string to integer — unrelated types
  y <= integer("hello");
end architecture unrelated;
