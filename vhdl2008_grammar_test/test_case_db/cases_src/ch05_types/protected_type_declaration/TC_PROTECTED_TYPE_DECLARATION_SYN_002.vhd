-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATION_SYN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declaration ::=
--   protected
--     protected_type_declarative_part
--   end protected [ protected_type_simple_name ]
-- Test Focus: Declaration with multiple subprogram declarations
--   — two procedures and an impure function. Tests that the
--   declarative part supports multiple items before 'end'.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_multi_subp is
  port (
    rst   : in  bit;
    cnt   : out natural
  );
end entity pt_decl_multi_subp;

architecture rtl of pt_decl_multi_subp is
  type t_tristate is protected
    procedure drive(v : bit);
    procedure hi_z;
    impure function is_driving return bit;
  end protected;
  type t_tristate is protected body
    variable v_val  : bit := '0';
    variable v_en   : bit := '0';
    procedure drive(v : bit) is begin v_val := v; v_en := '1'; end procedure;
    procedure hi_z is begin v_en := '0'; end procedure;
    impure function is_driving return bit is begin return v_en; end function;
  end protected body;
  shared variable sv : t_tristate;
begin
  process(rst)
  begin
    if rst'event and rst = '1' then
      sv.drive('1');
      if sv.is_driving = '1' then cnt <= 1; else cnt <= 0; end if;
    end if;
  end process;
end architecture rtl;
