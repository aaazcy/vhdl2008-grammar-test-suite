-- =============================================================
-- Case ID: TC_SEM_TYPE_008_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_TYPE_008
-- Standard Reference: IEEE 1076-2008 Section 5.2.4
-- Rule Description: Secondary unit names in a physical type must be unique within the unit list
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Physical type declares the secondary unit MHz twice ('MHz = 1000 kHz; MHz = 1 MHz;'), so the same unit identifier is declared twice within one unit list
-- Expected Result: Triggers semantic error: identifier "mhz" already used for a declaration
-- Dependencies: None
-- =============================================================
entity ph32_ent is end entity;
architecture rtl of ph32_ent is
  type t_bad_phys is range 0 to 1000 units
    kHz;
    MHz = 1000 kHz;
    MHz = 1 MHz;
  end units;
begin
end architecture;
