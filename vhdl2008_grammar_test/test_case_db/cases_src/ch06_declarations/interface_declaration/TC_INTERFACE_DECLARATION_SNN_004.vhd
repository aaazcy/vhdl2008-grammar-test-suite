-- =============================================================
-- Case ID: TC_INTERFACE_DECLARATION_SNN_004
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_INTERFACE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_declaration ::=
--   interface_object_declaration
--   | interface_type_declaration
--   | interface_subprogram_declaration
--   | interface_package_declaration
-- Case Type: Negative
-- Test Focus: SNN — invalid mode token "buffer" in an
--   interface_constant_declaration (BNF only allows [ in ]).
--   The mode "buffer" is not a valid alternative at this position.
-- Expected Result: Triggers syntax error (invalid mode)
-- Dependencies: None
-- =============================================================
entity iface_decl_bad_mode_e is
  generic (
    -- ERROR: "buffer" is not a valid mode for constant interface
    constant WIDTH : buffer integer := 8
  );
  port (
    din  : in  bit_vector(7 downto 0);
    dout : out bit_vector(7 downto 0)
  );
end entity iface_decl_bad_mode_e;

architecture err of iface_decl_bad_mode_e is
begin
  dout <= din;
end architecture err;
