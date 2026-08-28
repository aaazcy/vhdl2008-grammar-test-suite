-- =============================================================
-- Case ID: TC_MODE_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_MODE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: mode ::= in | out | inout | buffer | linkage
-- Case Type: Negative
-- Test Focus: SEMANTIC ERROR: an in-mode port is used as the target of a signal assignment — 'data_in <= data_out;' attempts to drive the input port data_in, but in-mode ports cannot be assigned
-- Expected Result: Triggers semantic error: port "data_in" can't be assigned
-- Dependencies: None
-- =============================================================
entity mode_ent is
  port (
    data_in  : in  bit_vector(3 downto 0);
    data_out : out bit_vector(3 downto 0)
  );
end entity mode_ent;

architecture rtl of mode_ent is
begin
  data_in <= data_out;
end architecture rtl;
