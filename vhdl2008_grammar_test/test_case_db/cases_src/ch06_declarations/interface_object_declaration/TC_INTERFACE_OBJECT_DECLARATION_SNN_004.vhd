-- =============================================================
-- Case ID: TC_INTERFACE_OBJECT_DECLARATION_SNN_004
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_INTERFACE_OBJECT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_object_declaration ::=
--   interface_constant_declaration
--   | interface_signal_declaration
--   | interface_variable_declaration
--   | interface_file_declaration
-- Case Type: Negative
-- Test Focus: SNN — invalid mode token in an interface_signal_declaration
--   within a port clause. The mode designation uses a non-mode keyword
--   "constant" where a port mode (in, out, inout, buffer, linkage)
--   is expected by the BNF.
-- Expected Result: Triggers syntax error (invalid mode)
-- Dependencies: None
-- =============================================================
entity iface_obj_invalid_mode_e is
  port (
    signal clk      : in  bit;
    -- ERROR: "constant" is not a valid mode keyword for signal ports
    signal data_out : constant bit_vector(7 downto 0)
  );
end entity iface_obj_invalid_mode_e;

architecture err of iface_obj_invalid_mode_e is
begin
end architecture err;
