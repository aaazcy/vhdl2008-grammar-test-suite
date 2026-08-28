-- =============================================================
-- Case ID: TC_INTERFACE_FILE_DECLARATION_SNN_004
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_INTERFACE_FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_file_declaration ::=
--   file identifier_list : subtype_indication
-- Case Type: Negative
-- Test Focus: SNN — missing subtype_indication after colon in a
--   file interface declaration. BNF requires subtype_indication
--   as a mandatory token after the colon.
-- Expected Result: Triggers syntax error (missing subtype_indication)
-- Dependencies: None
-- =============================================================
entity file_iface_no_subtype_e is
  port (
    clk : in bit;
    done : out bit
  );
end entity file_iface_no_subtype_e;

architecture err of file_iface_no_subtype_e is
  procedure write_log(
    -- ERROR: colon present but no subtype_indication follows
    file log :
  ) is
  begin
  end procedure;
begin
  done <= '0';
end architecture err;
