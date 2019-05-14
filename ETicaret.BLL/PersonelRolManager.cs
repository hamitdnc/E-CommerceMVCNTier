using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ETicaret.DLL;


namespace ETicaret.BLL
{
    public class PersonelRolManager
    {
        EticaretDBEntities db = new EticaretDBEntities();
        Repository<PersonelRolleri> repRol = new Repository<PersonelRolleri>();

        public PersonelRolManager()
        {
            repRol.Liste();
        }

        public int InsertPersonelRol(string rolAdi)
        {
            int Ekle = repRol.insert(new PersonelRolleri()
            {
                RolAdi = rolAdi

            });
            return Ekle;
        }

        public List<PersonelRolleri> PersonelRolGetir()
        {
            return repRol.Liste();
        }

        public PersonelRolleri PersonelRolleriBul(int? personelRol_Id)
        {
            return repRol.ListeFiltre(r => r.PersonelRolleriID == personelRol_Id).FirstOrDefault();
        }

    }

}