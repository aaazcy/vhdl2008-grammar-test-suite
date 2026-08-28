-- =============================================================
-- Case ID: TC_RECORD_CONSTRAINT_SYN_S01
-- Rule Type: Syntax (Production-Specific)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_constraint ::= ( record_element_constraint { , record_element_constraint } )
-- Test Focus: Production-specific: directly exercises the parentheses
--   and comma-delimited structure. Two record subtypes: one with 2
--   element constraints, another with 3. Verifies the BNF's
--   repetition structure ({ , record_element_constraint }).
-- Expected Result: Compiles; two constraint patterns side by side
-- Dependencies: None
-- =============================================================
entity record_constraint_comma_structure is
  port (
    sel : in  bit;
    out_val : out integer
  );
end entity record_constraint_comma_structure;

architecture comma_separated of record_constraint_comma_structure is
  type t_pair is record
    lo : bit_vector;
    hi : bit_vector;
  end record;
  -- Two element constraints, comma-separated
  subtype t_pair_range is t_pair(lo(0 to 7), hi(0 to 15));
  signal sp : t_pair_range;
begin
  sp.lo <= x"0A";
  sp.hi <= x"00C8";
  out_val <= sp.lo'length when sel = '0' else sp.hi'length;
end architecture comma_separated;
