-- =============================================================
-- Case ID: TC_SIGNAL_KIND_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_KIND
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: signal_kind ::= register | bus
-- Case Type: Negative
-- Test Focus: ERROR: signal kind "register" used on a signal that is not guarded - register kind requires guarded signal assignment.
-- Expected Result: Triggers warning or error (register on unguarded signal)
-- Dependencies: None
-- =============================================================
entity signal_kind_snn4 is
  port (
    clk  : in  bit;
    data : in  bit_vector(3 downto 0)
  );
end entity signal_kind_snn4;

architecture arch of signal_kind_snn4 is
  signal s_reg : bit_vector(3 downto 0) register;
begin
  s_reg <= data;
end architecture arch;
